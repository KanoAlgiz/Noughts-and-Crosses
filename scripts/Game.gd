extends Node
class_name Game

# X = 1, O = -1, EMPTY = 0

@onready var interface: Interface = %Interface
var winChecker: WinChecker = WinChecker.new()
var board: Array2D = Array2D.new(3, 3)
var aiStrategy: AiStrategy
var isGameOver = false

func _ready():
	aiStrategy = RandomCellStrategy.new()
	interface.refresh(board)

func onPlayerMove(x, y):
	board.setValue(x, y, 1)
	checkForGameEnd(x, y)
	
	if !isGameOver:
		var selectedIndex: Dictionary = aiStrategy.selectCell(board)
		board.setValue(selectedIndex["x"], selectedIndex["y"], -1)
		checkForGameEnd(selectedIndex["x"], selectedIndex["y"])
		
	interface.refresh(board)
		
func checkForGameEnd(moveX: int, moveY: int):
	var winner =  winChecker.getWinnerForMove(board, moveX, moveY)
	
	if winner == -1:
		interface.showText("You Lose!")
		isGameOver = true
	elif winner == 1:
		interface.showText("You Win!")
		isGameOver = true
	elif board.isAllFilled():
		interface.showText("Tie!")
		isGameOver = true
