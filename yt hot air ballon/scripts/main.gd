extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_start_pressed():
	get_tree().change_scene("res://scenes/play_scene.tscn")
