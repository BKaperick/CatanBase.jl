cd CatanEngine.jl/test
julia --project=.. ./runtests.jl
cd ../..
cd CatanLearning.jl/test
julia --project=.. ./runtests.jl
cd ../..
cd RunScripts
julia run.jl configs/validate_ml_player_config.toml
