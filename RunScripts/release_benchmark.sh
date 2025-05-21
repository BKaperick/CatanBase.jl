cd ../CatanEngine.jl
git checkout v0.0.1
cd ../RunScripts
julia -e "include(\"run.jl\"); benchmark_one_game(\"configs/benchmark_run.toml\", \"v0.0.1\")"
cd ../CatanEngine.jl
git checkout master
cd ../RunScripts
julia -e "include(\"run.jl\"); benchmark_one_game(\"configs/benchmark_run.toml\", \"v.0.1.0\")"
