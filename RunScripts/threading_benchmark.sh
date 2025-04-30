julia -e "include(\"run.jl\"); threading_benchmark_run(\"configs/benchmark_run.toml\")" --threads 1
julia -e "include(\"run.jl\"); threading_benchmark_run(\"configs/benchmark_run.toml\")" --threads 2
#julia -e "include(\"run.jl\"); threading_benchmark_run(\"configs/benchmark_run.toml\")" --threads 3
#julia -e "include(\"run.jl\"); threading_benchmark_run(\"configs/benchmark_run.toml\")" --threads 4
