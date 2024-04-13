extends Control
class_name Interface

@onready var game: Game = get_parent()
@onready var label: Label = $Label
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

func onCellClick(x: int, y: int):
	game.onPlayerMove(x, y)
	
func showWinText():
	label.text = "Game Over!"
	
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
