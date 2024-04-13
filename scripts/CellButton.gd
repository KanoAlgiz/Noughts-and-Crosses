extends Node
class_name CellButton

@export var x: int
@export var y: int
@onready var interface: Interface = %Interface

func _on_pressed():
	interface.onCellClick(x, y)
