extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		move_and_collide(Vector2(1000,0) * delta)
	if Input.is_action_pressed("move_left"):
		move_and_collide(Vector2(-1000, 0) * delta)
