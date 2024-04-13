extends Object
class_name WinChecker

# X = 1, O = -1, NO_WINNER = 0
func getWinnerForMove(board: Array2D, moveX: int, moveY: int) -> int:
	var winner
	
	if isEqual(board.getValue(moveX, 0), board.getValue(moveX, 1), board.getValue(moveX, 2)):
		return board.getValue(moveX, 0)
		
	if isEqual(board.getValue(0, moveY), board.getValue(1, moveY), board.getValue(2, moveY)):
		return board.getValue(0, moveY)
		
	if moveX == moveY:
		if isEqual(board.getValue(0, 0), board.getValue(1, 1), board.getValue(2, 2)):
			return board.getValue(1, 1)
			
	if moveX + moveY == 2:
		if isEqual(board.getValue(0, 2), board.getValue(1, 1), board.getValue(2, 0)):
			return board.getValue(1, 1)
			
	return 0
	
func isEqual(first: int, second: int, third: int) -> bool:
	return first == second and second == third
