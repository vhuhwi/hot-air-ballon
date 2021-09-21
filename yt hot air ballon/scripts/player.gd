extends Area2D




# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass


func _input(event):
	if event is InputEventMouseMotion:
		position.x += event.relative.x
		position.x = clamp(position.x,5,335)
		

