extends Object
class_name Array2D

var data: Array[Variant] = []
var xSize: int
var ySize: int

func _init(requestedXSize: int, requestedYSize: int):
	xSize = requestedXSize
	ySize = requestedYSize
	data.resize(xSize * ySize)
	data.fill(0)
	
func getCellNumber(x: int, y: int):
	return x + (y * xSize)
	
func getValue(x: int, y: int):
	return data[getCellNumber(x, y)]
	
func setValue(x: int, y: int, value):
	data[getCellNumber(x, y)] = value
	
func forEach(function: Callable):
	for x in xSize:
		for y in ySize:
			function.call(x, y, getValue(x, y))
			
func isAllFilled() -> bool:
	for item in data:
		if item == 0: return false
		
	return true
	
func getCopy() -> Array2D:
	var copy = Array2D.new(xSize, ySize)
	for i in data.size():
		copy.data[i] = data[i]
	return copy
