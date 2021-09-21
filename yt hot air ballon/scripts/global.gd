extends Node


var level = 1
var speed = 200
var score = 0
var hi_score  =0
var magnet_force = false

var target = Vector2.ZERO

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hi_score < score:
		hi_score = score
	

