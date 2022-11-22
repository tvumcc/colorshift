extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rot_speed = .5  # num 
var velocity = Vector2()
var scale_spd = .1
var scale_dir = 1
var max_scale = 1.3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rot_speed * delta
	scale.x += delta*scale_spd*scale_dir
	if scale.x > max_scale:
		scale.x = max_scale
		scale_dir = -1
	elif scale.x < 1:
		scale.x = 1
		scale_dir = 1
		
	scale.y = scale.x
	velocity = move_and_slide(velocity)
