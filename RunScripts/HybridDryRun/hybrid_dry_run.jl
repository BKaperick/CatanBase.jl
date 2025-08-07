include("../run.jl")
# Clean up

function explore_linear_player(iters = 5)
    rm("canonical_features.csv", force=true)
    rm("canonical_public_features.csv", force=true)
    exploring = Dict()
    for i=1:iters
        println("Exploratory run: $i")
        run_tournament("Config1.toml")
        winners = run_tournament("Config2.toml")
        exploring[10_000 * i] = winners[:blue] / 100
        @warn "After $(10_000 * i) exploratory rounds, EmpathRobotPlayer(Search_depth=1) wins $(100 * winners[:blue] / 100)% of games"
    end
    return exploring
end
function explore_states(iters = 5)
    #rm("state_values.csv", force=true)
    exploring = Dict()
    for i=1:iters
        println("Exploratory run: $i")
        run_tournament("Config4.toml")
        unique_states = countlines("state_values.csv")
        exploring[10_000 * i] = unique_states
        @warn "After $(10_000 * i) exploratory rounds, HybridPlayer encountered $(unique_states) unique gamestates"
    end
    return exploring
end
#=
println(run_tournament("Config3.toml"))
rm("state_values.csv", force=true)
println(run_tournament("Config4.toml"))
=#
