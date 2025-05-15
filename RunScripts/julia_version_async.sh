julia +1.10.9 -e "include(\"run.jl\"); run_async(\"configs/version_compare_async_config.toml\")" --threads 1
julia -e "include(\"run.jl\"); run_async(\"configs/version_compare_async_config.toml\")" --threads 1
julia +1.10.9 -e "include(\"run.jl\"); run_async(\"configs/version_compare_async_config.toml\")" --threads 16
julia -e "include(\"run.jl\"); run_async(\"configs/version_compare_async_config.toml\")" --threads 16
