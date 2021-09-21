extends KinematicBody2D


var motion = Vector2.ZERO

const DEFALT_SPEED = 700



# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


func _process(delta):
	var motion_y = Global.speed*Global.level
	var closet  = self.position.distance_to(Global.target)
	if Global.magnet_force and closet <= 340:
		motion = (Global.target - self.position).normalized()*DEFALT_SPEED
	else:
		motion.y = Global.speed*Global.level

	move_and_slide(motion,Vector2.UP)
