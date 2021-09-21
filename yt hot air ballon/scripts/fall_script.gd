extends KinematicBody2D


var motion : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	motion.y = Global.speed*Global.level
	move_and_slide(motion,Vector2.UP)
