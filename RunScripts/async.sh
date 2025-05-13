#julia -e "include(\"run.jl\"); @btime run_async(\"configs/async_config.toml\")" --threads 1
julia -e "include(\"run.jl\"); run_async(\"configs/async_config.toml\")" --threads 1
julia -e "include(\"run.jl\"); run_async(\"configs/async_config.toml\")" --threads 2
julia -e "include(\"run.jl\"); run_async(\"configs/async_config.toml\")" --threads 4
julia -e "include(\"run.jl\"); run_async(\"configs/async_config.toml\")" --threads 8
julia -e "include(\"run.jl\"); run_async(\"configs/async_config.toml\")" --threads 16
