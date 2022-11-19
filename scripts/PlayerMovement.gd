extends KinematicBody2D


var jump_speed = -900
var horizontal_speed = 800
var gravity = 2500

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func _physics_process(delta):
	velocity.x = 0
	if is_on_floor() and Input.is_action_pressed('jump'):
		velocity.y = jump_speed
	if Input.is_action_pressed('move_right'):
		velocity.x = horizontal_speed
	if Input.is_action_pressed('move_left'):
		velocity.x = -horizontal_speed
	velocity.y += gravity * delta

	velocity = move_and_slide(velocity, Vector2(0, -1))
