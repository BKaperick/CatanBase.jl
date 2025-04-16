using Catan
using CatanLearning
using Profile

function retrain_models(config_file)
    (configs, player_configs, logger) = Catan.parse_configs(config_file)
    #CatanLearning.train_and_serialize_model(player_configs["FEATURES"], player_configs["MODEL"])
    CatanLearning.train_and_serialize_model(player_configs["PUBLIC_FEATURES"], player_configs["PUBLIC_MODEL"])
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
    (configs, player_configs, logger) = Catan.parse_configs(config_file)
    configs["PlayerSettings"]["FEATURES"] = replace(configs["PlayerSettings"]["FEATURES"], ".csv" => "_$file_suffix.csv")
    configs["PlayerSettings"]["PUBLIC_FEATURES"] = replace(configs["PlayerSettings"]["PUBLIC_FEATURES"], ".csv" => "_$file_suffix.csv")
    player_schemas = Catan.read_player_constructors_from_config(player_configs)
    CatanLearning.run(player_schemas, configs)
end

function run(config_file::String)
    (configs, player_configs, logger) = Catan.parse_configs(config_file)
    player_schemas = Catan.read_player_constructors_from_config(player_configs)
    CatanLearning.run(player_schemas, configs)
end

function profile_run(config_file)
    (configs, player_configs, logger) = Catan.parse_configs(config_file)
    player_schemas = Catan.read_player_constructors_from_config(player_configs)
    @profile CatanLearning.run(player_schemas, configs)
    #Profile.print(open("prof.txt", "w"), format=:flat, sortedby=:count, mincount=100)
    open("./tmp/prof.txt", "w") do s
        Profile.print(IOContext(s, :displaysize => (24, 500)), sortedby=:count, mincount=100)
    end
end

if ~isinteractive() && length(ARGS) > 0
    run(ARGS...)
end
