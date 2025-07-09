# First, we clear data files
rm ./data/state_values.csv
rm ./linear_model.csv
rm ./linear_public_model.csv
julia --project=../catanlearning.jl -e "include(\"run.jl\"); run_state_space_tournament(\"configs/all_hybrid_explore.toml\")"

# remove weights so we retrain them based on the latest data
rm ./linear_model.csv
rm ./linear_public_model.csv
julia --project=../CatanLearning.jl -e "include(\"run.jl\"); run_state_space_tournament(\"configs/all_hybrid.toml\")"
