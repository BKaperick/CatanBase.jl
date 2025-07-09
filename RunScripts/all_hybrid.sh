# First, we clear data files
rm ./data/state_values.csv
rm ./models/linear_model.csv
rm ./models/linear_public_model.csv
julia --project=../CatanLearning.jl -e "include(\"run.jl\"); run_state_space_tournament(\"configs/all_hybrid_explore.toml\")"

# Remove weights so we retrain them based on the latest data
rm ./models/linear_model.csv
rm ./models/linear_public_model.csv
julia --project=../CatanLearning.jl -e "include(\"run.jl\"); run_state_space_tournament(\"configs/all_hybrid.toml\")"
