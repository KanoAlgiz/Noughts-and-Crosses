extends Node
class_name Game

# X = 1, O = -1, EMPTY = 0

@onready var interface: Interface = %Interface
var winChecker: WinChecker = WinChecker.new()
var board: Array2D = Array2D.new(3, 3)
var aiStrategy: AiStrategy
var isGameOver = false

func _ready():
	aiStrategy = RandomStrategy.new()
	interface.refresh(board)

func onPlayerMove(x, y):
	board.setValue(x, y, 1)
	checkForGameEnd()
	
	if !isGameOver:
		doComputerMove()
		checkForGameEnd()
		
	interface.refresh(board)
		
func checkForGameEnd():
	if winChecker.checkForGameEnd(board) != 0:
		interface.showWinText()
		isGameOver = true
	
func doComputerMove():
	var selectedIndex: Dictionary = aiStrategy.selectCell(board)
	board.setValue(selectedIndex["x"], selectedIndex["y"], -1)
