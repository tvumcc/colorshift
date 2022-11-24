extends KinematicBody2D


var jump_speed = -900
var horizontal_speed = 800
var gravity = 2500
var rotation_amount = .1  # in radians
var wait = false

var velocity = Vector2()

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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
	collcheck()
	
	
func collcheck():
	for index in get_slide_count():
		var collision := get_slide_collision(index)
		var body := collision.collider
		if body.is_in_group("deathbox"):
			die()
		elif body.is_in_group("endpoint") and !wait:
			wait = true
			moveon()

func clearhand():
	$'Hand'.drop()
			
func die():
	#$"/root/Main".loadlevel($"/root/Main".get("levelpack"))
	clearhand()
	position = $"/root/Main".get("level").startpos

func moveon():
	# code to load next level
	clearhand()
	$"/root/Main".gonext($"/root/Main".get("levelpack"))
	yield(get_tree().create_timer(0.1), "timeout")
	wait = false
