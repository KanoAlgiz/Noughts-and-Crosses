extends Object
class_name WinChecker

func checkForGameEnd(board: Array2D) -> int:
	var winner
	
	for y in 3:
		winner = getRowWinner(board, y) / 3
		if winner != 0:
			return winner
			
	for x in 3:
		winner = getColumnWinner(board, x) / 3
		if winner != 0:
			return winner
			
	return 0
	
func getRowWinner(board: Array2D, lineNumber) -> int:
	var winner: int
	for x in 3:
		winner = winner + board.getValue(x, lineNumber)
	return winner
	
func getColumnWinner(board: Array2D, columnNumber):
	var winner: int
	for i in 3:
		winner = winner + board.getValue(columnNumber, i)
	return winner
