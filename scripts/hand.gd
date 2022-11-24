extends Node2D

var item
var currentlytouched = false
var holding = false
export(NodePath) var fasd
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var held = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	rotation_degrees = 0
	look_at(get_global_mouse_position())
	rotation_degrees += 90
	if !holding:
		if Input.is_action_just_pressed("click") and currentlytouched:
			holding = true
			if not(item in held): held.append(item)
			print(held)
	else:
		item.position = get_children()[0].global_position
		if Input.is_action_just_pressed("click"):
			holding = false
			

func dropall():
	print('dropping all')
	for it in held:
		# send each item back
		print('sending back ',it)
		it.goback()
	held = [] # reset held
	holding = false

func _on_Hand_body_entered(body):
	if !holding:
		item = body
		currentlytouched = true
	print(body)

func _on_Hand_body_exited(body):
	currentlytouched = false
