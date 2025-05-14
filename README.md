This repository contains two submodules for two 'sister' Julia packages: `Catan.jl` and `CatanLearning.jl`.

`Catan.jl` is an engine for playing the extremely popular board game [Settlers of Catan](https://www.catan.com/) with a mixture of human and fully-customizable scripted players.
To get started with `Catan.jl`, check out the documentation [here](https://bkaperick.github.io/CatanEngine.jl/).

`CatanLearning.jl` is a suite of utilities to experiment with machine learning and reinforcement learning players using `Catan.jl`.

# Features

## Catan.jl
* Full ruleset of vanilla Settlers of Catan is implemented
* Colored ASCII board display for debugging and rendering play with humans easier
* Custom scripted players can be implemented and played against humans or other scripted players
* Many global parameters are exposed via TOML configuration keys, allowing for tweaking map generation and resource distribution

## CatanLearning.jl
* Fast feature generation framework with a library of 50+ board state features implemented as starting point for ML-based players
* Temporal difference stepping exploration implemented as starting point for RL-based players
* Recursive action consideration implemented as starting point for pruning/search tree-based players
