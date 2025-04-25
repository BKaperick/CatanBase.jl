using Catan
using CatanLearning
using Profile
using BenchmarkTools

function retrain_models(config_file)
    configs = Catan.parse_configs(config_file)
    player_configs = configs["PlayerSettings"]
    iter = 1
    CatanLearning.train_and_serialize_model(player_configs["FEATURES"], player_configs["MODEL"], num_tuning_iterations = 30)
    CatanLearning.train_and_serialize_model(player_configs["PUBLIC_FEATURES"], player_configs["PUBLIC_MODEL"], num_tuning_iterations = 30)
    cp(player_configs["PUBLIC_MODEL"], "../CatanLearning.jl/test/data/public_model.jls", force=true)
    cp(player_configs["MODEL"], "../CatanLearning.jl/test/data/model.jls", force=true)
end

function run(args::Tuple)
    if length(args) == 1
        run(args[1])
    else
        run(args[1], args[2])
    end
end

"""
    `run(config_file::String, file_suffix)`

A bit of a hack.  For parallel runs of fature generation, to stop locking issues, we pass a 
random number to CLI via bash script so each worker is writing to a different file.
"""
function run(config_file::String, file_suffix)
    configs = Catan.parse_configs(config_file)
    configs["PlayerSettings"]["FEATURES"] = replace(configs["PlayerSettings"]["FEATURES"], ".csv" => "_$file_suffix.csv")
    configs["PlayerSettings"]["PUBLIC_FEATURES"] = replace(configs["PlayerSettings"]["PUBLIC_FEATURES"], ".csv" => "_$file_suffix.csv")
    player_schemas = Catan.read_player_constructors_from_config(configs["PlayerSettings"])
    CatanLearning.run(player_schemas, configs)
end

function run(config_file::String)
    configs = Catan.parse_configs(config_file)
    player_schemas = Catan.read_player_constructors_from_config(configs["PlayerSettings"])
    CatanLearning.run(player_schemas, configs)
end

function profile_run(config_file)
    configs = Catan.parse_configs(config_file)
    @profile Catan.run(configs)
    open("./tmp/prof.txt", "w") do s
        Profile.print(IOContext(s, :displaysize => (24, 500)), sortedby=:count, mincount=100)
    end
end

function benchmark_dry_run(config_file::String)
    configs = Catan.parse_configs(config_file)
    configs["PlayerSettings"]["blue"]["TYPE"] = "EmpathRobotPlayer"
    configs["PlayerSettings"]["blue"]["SEARCH_DEPTH"] = 1
    configs["LOG_OUTPUT"] = "stderr"
    configs["LOG_LEVEL"] = "Info"
    Catan.parse_logging_configs!(configs)
    Catan.run(configs)
end

function benchmark_run(config_file::String, output_file)
    configs = Catan.parse_configs(config_file)
    io = open(output_file, "w")
    t1 = benchmark_run(configs)
    println(io, "4 DefaultRobotPlayers - 10 turns - no saving or logging")
    show(io, MIME"text/plain"(), t1)
    
    print(io, "\n\n")
    
    configs["PlayerSettings"]["blue"]["TYPE"] = "EmpathRobotPlayer"
    configs["PlayerSettings"]["blue"]["SEARCH_DEPTH"] = 1
    t2 = benchmark_run(configs)
    println(io, "1 EmpathRobotPlayer(SEARCH_DEPTH=1) - 10 turns - no saving or logging")
    show(io, MIME"text/plain"(), t2)
    
    close(io)
    return [t1, t2]
end

function benchmark_run(configs::Dict)
    b = @benchmarkable Catan.run($configs) seconds=30
    t = BenchmarkTools.run(b)
    show(stdout, MIME"text/plain"(), t)
    return t
end

if ~isinteractive() && length(ARGS) > 0
    run(ARGS...)
end
