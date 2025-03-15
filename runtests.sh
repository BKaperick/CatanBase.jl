cd CatanEngine.jl/test
julia --project=.. ./runtests.jl
cd ../..
julia --project=CatanLearning.jl -e 'include("CatanLearning.jl/src/CatanLearning.jl"); Catan.run(["CatanEngine.jl/data/config.txt", "./CatanEngine.jl/data/sample.csv", "./CatanEngine.jl/save.txt"])'

