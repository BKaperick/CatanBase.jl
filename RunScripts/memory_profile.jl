using Revise
using Catan
using JET
#using CatanLearning
using Profile
using BenchmarkTools
using ProfileView
using PProf
using Base.Threads


# INIT
#config_file = ARGS[1]
println(config_file)
configs = Catan.parse_configs(config_file)
board = Catan.read_map(configs)
player1 = DefaultRobotPlayer(:Test1, configs)
player2 = DefaultRobotPlayer(:Test2, configs)
players = Vector{PlayerType}([player1, player2])

Profile.Allocs.clear()


#Catan.run(configs)
#Profile.Allocs.@profile sample_rate=1 Catan.run(configs)

@report_opt Catan.do_robber_move_theft(board, players, player1)
@code_warntype Catan.do_robber_move_theft(board, players::Vector{PlayerType}, player1)
#Profile.Allocs.@profile sample_rate=1 Catan.do_robber_move_theft(board, players, player1) 
#PProf.Allocs.pprof(from_c=false)
