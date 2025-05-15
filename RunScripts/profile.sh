julia -e "include(\"run.jl\"); profile_run(\"configs/profile_run.toml\")"
#julia -e "include(\"run.jl\"); configs = Catan.parse_configs(\"configs/simple_profile_run.toml\"); @profview Catan.run(configs)"
