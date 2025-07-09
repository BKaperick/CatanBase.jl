#julia -e "include(\"run.jl\"); run_one(\"configs/one_empath.toml\")"
#julia -e "include(\"run.jl\"); memory_profile_run(\"configs/one_empath.toml\")"
julia -e "include(\"run.jl\"); memory_profile_run(\"configs/hybrid_benchmark_run.toml\")"
