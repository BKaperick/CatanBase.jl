rm  benchmark_catan_release.txt
: '
cd ../CatanEngine.jl
git checkout v0.1.0
cd ../RunScripts
julia -e "include(\"run_without_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"v0.1.0\")"
cd ../CatanEngine.jl
git checkout v0.2.0
cd ../RunScripts
julia -e "include(\"run_without_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"v.0.2.0\")"
cd ../CatanEngine.jl
git checkout v0.3.0
cd ../RunScripts
julia -e "include(\"run_without_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"v.0.3.0\")"
cd ../CatanEngine.jl
git checkout v0.4.0
cd ../RunScripts
julia -e "include(\"run_without_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"v.0.4.0\")"
cd ../CatanEngine.jl
git checkout v0.5.0
cd ../RunScripts
julia -e "include(\"run_without_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"v.0.5.0\")"
cd ../CatanEngine.jl
git checkout v1.0.0
cd ../RunScripts
julia -e "include(\"run_without_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"v.1.0.0\")"
'

cd ../CatanEngine.jl
git checkout master
cd ../RunScripts
julia -e "include(\"run_without_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"v.1.0.1\")"
cd ../CatanEngine.jl
git checkout feat_board_map_mut
cd ../RunScripts
julia -e "include(\"run_without_learning.jl\"); benchmark_one_game(\"configs/default_benchmark_run.toml\", \"v.1.0.1\")"

cp run_without_learning.jl ../CatanEngine.jl/benchmarks/
cp configs/default_benchmark_run.toml ../CatanEngine.jl/benchmarks/
cp release_benchmark_catan.sh ../CatanEngine.jl/benchmarks/release_benchmark.sh
cp benchmark_catan_release.txt ../CatanEngine.jl/benchmarks/
