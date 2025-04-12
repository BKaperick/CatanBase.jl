using Catan
using CatanLearning

function run(config_file)
    (configs, player_configs, logger) = Catan.parse_configs(config_file)
    player_schemas = Catan.read_player_constructors_from_config(player_configs)
    #create_players = () -> [p() for p in player_constructors]
    CatanLearning.run(player_schemas, configs)
end

if ~isinteractive()
    run(ARGS[1])
end
