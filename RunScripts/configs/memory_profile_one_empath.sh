SAVE_GAME_TO_FILE = false
SAVE_FILE = "savefile.txt"
#LOG_OUTPUT = ""
LOG_OUTPUT = "stderr"
LOG_LEVEL = ""
PRINT_BOARD = false
TEAMS = ["blue", "cyan", "green", "yellow"]
WRITE_FEATURES = false
MAX_TURNS = 10

[Tournament]
GAMES_PER_MAP = 1
MAPS_PER_EPOCH = 1
# Number of epochs (1 epoch is M*N games) to run
NUM_EPOCHS = 1

[GameSettings]
[GameSettings.DevCards]
#KNIGHT = 0
#ROAD_BUILDING = 0
#YEAR_OF_PLENTY = 20
#MONOPOLY = 0
#VICTORY_POINT = 0

[HypothGameSettings]
LOG_OUTPUT = "stderr"
LOG_LEVEL = "Warn"

[PlayerSettings]
MODEL = "../CatanLearning.jl/models/model.jls"
PUBLIC_MODEL = "../CatanLearning.jl/models/public_model.jls"
FEATURES = "./data/features.csv"
PUBLIC_FEATURES = "./data/public_features.csv"
[PlayerSettings.blue]
TYPE = "EmpathRobotPlayer"
SEARCH_DEPTH = 1
[PlayerSettings.cyan]
TYPE = "DefaultRobotPlayer"
[PlayerSettings.green]
TYPE = "DefaultRobotPlayer"
[PlayerSettings.yellow]
TYPE = "DefaultRobotPlayer"
