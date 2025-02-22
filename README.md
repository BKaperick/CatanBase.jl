# Catan.jl

An engine for playing the extremely popular board game [Settlers of Catan](https://www.catan.com/) with a mixture of human and scripted players.
Includes a framework for easily implementing scripted players with custom strategies by implementing the functions defined in the API in `./src/players/robot_player.jl`.

## Features

* Full ruleset of vanilla Settlers of Catan is implemented
* Custom scripted players can be implemented and played against humans or other scripted players
* Colored ASCII board display for debugging and rendering play with humans easier.

## Set-up

Consult [CatanLearning.jl/src/players/structs.jl](https://github.com/BKaperick/CatanLearning.jl/blob/master/src/players/structs.jl) for an example implementation of a new scripted player.

Then, consult [CatanLearning.jl/src/main.jl](https://github.com/BKaperick/CatanLearning.jl/blob/master/src/main.jl) for an example of running the `CatanEngine.jl` code with the new player type.
