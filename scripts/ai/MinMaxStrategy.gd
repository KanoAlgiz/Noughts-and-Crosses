extends AiStrategy
class_name MinMaxStrategy

var checker: WinChecker = WinChecker.new()

# best move for O is negative
func selectCell(board: Array2D) -> Dictionary:
	var bestScore = null
	var moveScore
	var bestMove: Dictionary = {"x": null, "y": null}
	var boardCopy = board.getCopy();

	for x in 3:
		for y in 3:
			if boardCopy.getValue(x, y) == 0:
				moveScore = getMoveScore(boardCopy, x, y, -1)
				if moveScore == -1: 
					return {"x": x, "y": y}
				if bestScore == null || moveScore < bestScore:
					bestScore = moveScore
					bestMove["x"] = x
					bestMove["y"] = y

	return bestMove
	
func getMoveScore(board: Array2D, moveX: int, moveY: int, playerMark: int):	
	if checker.isWinningMove(board, moveX, moveY, playerMark): 
		return playerMark
	
	board.setValue(moveX, moveY, playerMark)
	
	if board.isAllFilled():
		board.setValue(moveX, moveY, 0)
		return 0
	
	var score = null
	var moveScore

	for x in 3:
		for y in 3:
			if board.getValue(x, y) == 0:
				moveScore = getMoveScore(board, x, y, -playerMark)
				
				if moveScore == playerMark:
					board.setValue(moveX, moveY, 0)
					return moveScore
					
				if score == null:
					score = moveScore
					continue
						
				if playerMark == 1 && moveScore > score:
					score = moveScore
				elif playerMark == -1 && moveScore < score:
					score = moveScore
		
	board.setValue(moveX, moveY, 0)
	return score
