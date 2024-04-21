extends Control
class_name Interface

@onready var game: Game = get_parent()
@onready var statusLabel: Label = %StatusLabel
@onready var scoreXLabel: Label = %YouScore
@onready var scoreOLabel: Label = %FoeScore
@onready var newGameButton: Button = %NewGameButton
var buttons: Array2D = Array2D.new(3, 3)

func _ready():
	var button: Button
	for x in 3:
		for y in 3:
			button = get_node(str("%Cell-", x, "-", y))
			buttons.setValue(x, y, button)

func refresh(board: Array2D):
	board.forEach(refreshButtonText)
			
func refreshButtonText(x, y, value):
	var button = buttons.getValue(x, y)
	button.text = convertCellValueToText(value)
	button.mouse_filter = 0 if value == 0 else 2
	
func refreshScore(x: int, o: int):
	scoreXLabel.text = str(x)
	scoreOLabel.text = str(o)

func onCellClick(x: int, y: int):
	game.onPlayerMove(x, y)
	
func showText(text: String):
	statusLabel.text = text
	
func onDifficultyChange(isHardNow: bool):
	game.setAiStrategy(isHardNow)
	
func onNewGameButtonClick():
	newGameButton.visible = false
	game.startNewGame()

func showNewGameButton():
	newGameButton.visible = true
	
func convertCellValueToText(value: int) -> String:
	var result: String
	match value:
		0:
			result = ""
		1:
			result = "X"
		-1:
			result = "O"
			
	return result
