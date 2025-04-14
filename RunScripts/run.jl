using Catan
using CatanLearning
using Profile

function run(config_file)
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
    run(ARGS[1])
end
