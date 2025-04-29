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

function benchmark_run(config_file::String)
    trials = []
    configs = Catan.parse_configs(config_file)
    output_file = configs["BENCHMARK_OUTPUT"]
    io = open(output_file, "w")
    
    push!(trials, benchmark_run(configs, io, "4 DefaultRobotPlayers - $(configs["MAX_TURNS"]) turns - no saving or logging"))

    configs["MAX_TURNS"] = 20
    push!(trials, benchmark_run(configs, io, "4 DefaultRobotPlayers - $(configs["MAX_TURNS"]) turns - no saving or logging"))

    configs["MAX_TURNS"] = 30
    push!(trials, benchmark_run(configs, io, "4 DefaultRobotPlayers - $(configs["MAX_TURNS"]) turns - no saving or logging"))
    
    configs["MAX_TURNS"] = 10
    configs["PlayerSettings"]["blue"]["TYPE"] = "EmpathRobotPlayer"
    configs["PlayerSettings"]["blue"]["SEARCH_DEPTH"] = 1
    push!(trials, benchmark_run(configs, io, "1 EmpathRobotPlayer(SEARCH_DEPTH=1) - $(configs["MAX_TURNS"]) turns - no saving or logging"))
    
    configs["MAX_TURNS"] = 20
    push!(trials, benchmark_run(configs, io, "1 EmpathRobotPlayer(SEARCH_DEPTH=1) - $(configs["MAX_TURNS"]) turns - no saving or logging"))
    
    configs["MAX_TURNS"] = 30
    push!(trials, benchmark_run(configs, io, "1 EmpathRobotPlayer(SEARCH_DEPTH=1) - $(configs["MAX_TURNS"]) turns - no saving or logging"))


    close(io)
    return trials
end

function benchmark_run(configs::Dict, io, descr)
    b = @benchmarkable Catan.run($configs) seconds=10
    t = BenchmarkTools.run(b)

    # Print to REPL
    show(stdout, MIME"text/plain"(), t)
    println("")

    # Save to IO
    println(io, descr)
    show(io, MIME"text/plain"(), t)
    print(io, "\n\n")

    return t
end

if ~isinteractive() && length(ARGS) > 0
    run(ARGS...)
end
