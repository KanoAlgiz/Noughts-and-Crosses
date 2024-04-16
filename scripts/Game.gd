extends Node
class_name Game

# X = 1, O = -1, EMPTY = 0
@onready var interface: Interface = %Interface
var winChecker: WinChecker = WinChecker.new()
var board: Array2D = Array2D.new(3, 3)
var aiStrategy: AiStrategy
var isGameOver = false

func _ready():
	#aiStrategy = RandomCellStrategy.new()
	aiStrategy = MinMaxStrategy.new()
	interface.refresh(board)

func onPlayerMove(x, y):
	if winChecker.isWinningMove(board, x, y, 1):
		interface.showText("You Win!")
		isGameOver = true
		
	board.setValue(x, y, 1)
	
	if !isGameOver and board.isAllFilled():
		interface.showText("Tie!")
		isGameOver = true
	
	if !isGameOver:
		var selectedIndex: Dictionary = aiStrategy.selectCell(board)
		
		if winChecker.isWinningMove(board, selectedIndex["x"], selectedIndex["y"], -1):
			interface.showText("You Lose!")
			isGameOver = true
			
		board.setValue(selectedIndex["x"], selectedIndex["y"], -1)
		
	interface.refresh(board)
