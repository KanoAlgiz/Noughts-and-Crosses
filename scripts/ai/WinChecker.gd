extends Object
class_name WinChecker

# X = 1, O = -1, NO_WINNER = 0
func isWinningMove(board: Array2D, moveX: int, moveY: int, playerMark: int) -> bool:
	if isWinningLine(board, moveX, moveY, playerMark): return true
	if isWinningColumn(board, moveX, moveY, playerMark): return true
	if moveY == moveX and isWinningFirstDiagonal(board, moveX, playerMark): return true
	if moveY + moveX == 2 and isWinningSecondDiagonal(board, moveX, playerMark): return true
	return false

func isWinningLine(board: Array2D, moveX: int, moveY: int, playerMark: int) -> bool:
	for x in 3:
		if x != moveX and board.getValue(x, moveY) != playerMark: return false
	return true

func isWinningColumn(board: Array2D, moveX: int, moveY: int, playerMark: int) -> bool:
	for y in 3:
		if y != moveY and board.getValue(moveX, y) != playerMark: return false
	return true
	
func isWinningFirstDiagonal(board: Array2D, moveX: int, playerMark: int):
	for i in 3:
		if moveX != i and board.getValue(i, i) != playerMark: return false
	return true

func isWinningSecondDiagonal(board: Array2D, moveX: int, playerMark: int):	
	for x in 3:
		if moveX != x and board.getValue(x, 2 - x) != playerMark: return false
	return true
