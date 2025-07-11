using Catan
using CatanLearning
using Profile
using ProfileView

function run_async(n)
    println("num threads $(Threads.nthreads())")
    configs = Catan.parse_configs(joinpath(@__DIR__, "./configs/async_config.toml"))

    configs["Tournament"]["GAMES_PER_MAP"] = n
    CatanLearning.run_tournament_async(configs)
end

function run(n)
    cd(@__DIR__)
    configs = Catan.parse_configs(joinpath(@__DIR__, "./configs/async_config.toml"))
    CatanLearning.run_tournament(configs)
end

#@profview run_async(1)
#@profview run_async(100)
#@profview run(1)
#@profview run(100)