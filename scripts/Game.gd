extends Node
class_name Game

# X = 1, O = -1, EMPTY = 0
@onready var interface: Interface = %Interface
var winChecker: WinChecker = WinChecker.new()
var board: Array2D
var aiStrategy: AiStrategy
var isGameOver = true
var scoreX = 0;
var scoreO = 0
var stupidStrategy = RandomCellStrategy.new()
var cleverStrategy = MinMaxStrategy.new()

func _ready():
	setAiStrategy(false)
	
func startNewGame():
	isGameOver = false
	board = Array2D.new(3, 3)
	interface.refresh(board)
	interface.showText("Go!")
	
func setAiStrategy(isClever: bool):
	if isClever:
		aiStrategy = cleverStrategy
	else:
		aiStrategy = stupidStrategy

func onPlayerMove(x, y):
	if isGameOver: return
	
	if winChecker.isWinningMove(board, x, y, 1):
		interface.showText("You Win!")
		scoreX += 1
		isGameOver = true
		
	board.setValue(x, y, 1)
	
	if !isGameOver and board.isAllFilled():
		interface.showText("Tie!")
		isGameOver = true
	
	if !isGameOver:
		var selectedIndex: Dictionary = aiStrategy.selectCell(board)
		
		if winChecker.isWinningMove(board, selectedIndex["x"], selectedIndex["y"], -1):
			interface.showText("You Lose!")
			scoreO += 1
			isGameOver = true
			
		board.setValue(selectedIndex["x"], selectedIndex["y"], -1)
	
	if isGameOver: interface.showNewGameButton()
	interface.refresh(board)
	interface.refreshScore(scoreX, scoreO)
