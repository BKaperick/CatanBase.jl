#cd ../CatanEngine.jl
#git checkout v0.1.0
#cd ../RunScripts
julia -e "include(\"run.jl\"); benchmark_one_tournament(\"configs/all_hybrid_benchmark.toml\", \"4 HybridPlayers\"); benchmark_one_tournament(\"configs/all_empath_benchmark.toml\", \"4 EmpathRobotPlayers\")"

#cp run.jl ../CatanEngine.jl/benchmarks/
#cp configs/benchmark_run.toml ../CatanEngine.jl/benchmarks/
#cp release_benchmark_catan.sh ../CatanEngine.jl/benchmarks/release_benchmark.sh
#cp benchmark_catan_release.txt ../CatanEngine.jl/benchmarks/
