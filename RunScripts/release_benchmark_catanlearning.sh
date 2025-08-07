#rm benchmark_catan_release.txt
#julia -e "include(\"run_with_learning.jl\"); benchmark_one_game(\"configs/empath_benchmark_run_rf.toml\", \"4 EmpathRobotPlayer - DEPTH 1 - RF\")"
julia -e "include(\"run_with_learning.jl\"); benchmark_one_game(\"configs/empath_benchmark_run_depth_1.toml\", \"4 EmpathRobotPlayer - DEPTH 1 - LINEAR\")"
julia -e "include(\"run_with_learning.jl\"); benchmark_one_game(\"configs/empath_benchmark_run.toml\", \"4 EmpathRobotPlayer - DEPTH 2 - LINEAR\")"
#julia -e "include(\"run_with_learning.jl\"); benchmark_one_game(\"configs/hybrid_benchmark_run.toml\", \"4 HybridPlayer - DEPTH 1 - LINEAR\")"
#julia -e "include(\"run_with_learning.jl\"); benchmark_one_game(\"configs/hybrid_benchmark_run_pl.toml\", \"4 HybridPlayer - DEPTH 1 - LINEAR - PUBLIC MODEL LINEAR\")"
#julia -e "include(\"run_with_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"4 DefaultRobotPlayer\")"

#cp run_without_learning.jl ../CatanEngine.jl/benchmarks/
#cp configs/benchmark_run.toml ../CatanEngine.jl/benchmarks/
#cp release_benchmark_catan.sh ../CatanEngine.jl/benchmarks/release_benchmark.sh
#cp benchmark_catan_release.txt ../CatanLearning.jl/benchmarks/
