extends Control


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$score.text = str(Global.score)
	$hi_score.text ="HI " +str(Global.hi_score)
	

func _on_replay_pressed():
	Global.score = 0
	Global.level = 1
	get_tree().change_scene("res://scenes/play_scene.tscn")


func _on_quit_pressed():
	get_tree().quit()
