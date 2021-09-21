extends Node2D

var damage = true
export (PackedScene) var Coin
export (PackedScene) var Magnet
export (PackedScene) var Thons
export (PackedScene) var Visiblity

var coin_score = 10
var thon_score = 1
var max_level = 3
export var incr =1.5
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	Global.target = $player.global_position
	$CanvasLayer/score.text = str(Global.score)
	$CanvasLayer/hi_score.text = "HI "+str(Global.hi_score)


func _on_drop_timer_timeout():
	var no 
	var selection =[Coin,Thons,Magnet,Visiblity]
	var probability = randf()
	if  probability < 0.7:
		no = 0
	if  probability > 0.7 and probability <0.98:
		no = 1
	if probability > 0.98and probability <0.99:
		no = 2
	if  probability > 0.99:
		no = 3
	var prob = selection[no].instance()
	add_child(prob)
	prob.position.x =rand_range(5,335)


func _on_level_timer_timeout():
	if Global.level < max_level:
		
		Global.level *= incr
		$drop_timer.wait_time /= incr
	

func _on_Area2D_body_entered(body):
	body.queue_free()
	if body.is_in_group("thon"):
		Global.score += thon_score


func _on_player_body_entered(body):
	if body.is_in_group("coin"):
		body.queue_free()
		Global.score += coin_score
	elif body.is_in_group("thon"):
		if damage:
			$delay_timer.start()
			$player.hide()
	elif body.is_in_group("mag"):
		body.queue_free()
		Global.magnet_force = true
		$magnet_force.start()
	elif body.is_in_group("inv"):
		damage =false
		get_node("player/hotbalonicon").animation = "power"
		$visibility_timer.start()


		body.queue_free()
		


func _on_delay_timer_timeout():
	
	get_tree().change_scene("res://scenes/Control.tscn")


func _on_magnet_force_timeout():
	Global.magnet_force = false


func _on_visibility_timer_timeout():
	damage = true 
	get_node("player/hotbalonicon").animation = "const"
