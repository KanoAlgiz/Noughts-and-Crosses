extends AiStrategy
class_name RandomStrategy

func selectCell(board: Array2D):
	var isEmpty: bool = false
	var x: int
	var y: int
	
	# will hang up on filled board
	while !isEmpty:
		x = randi_range(0, 2)
		y = randi_range(0, 2)
		isEmpty = board.getValue(x, y) == 0 # is cell empty
		
	return {"x": x, "y": y}
