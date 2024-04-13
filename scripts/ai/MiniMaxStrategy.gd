extends AiStrategy
class_name MiniMaxStrategy

var checker: WinChecker = WinChecker.new()

func selectCell(board: Array2D) -> Dictionary:
	# get best move
	var bestScore = 0
	var moveScore
	var bestMove: Dictionary
	
	for x in 3:
		for y in 3:
			moveScore = getMoveScore(board, x, y, true)
			if moveScore > bestScore:
				bestScore = moveScore
				bestMove = {x: x, y: y}
	
	return bestMove
	
func getMoveScore(board: Array2D, x: int, y: int, isMyMove: bool):
	#winner = get winner for board with new mark
	pass
