extends KinematicBody2D

export(Vector2) var point1
export(Vector2) var point2
export (int) var speed = 1
var velocity = Vector2()
var bnf = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speeda = speed
	if position == point1 or position == point2:
		bnf = !bnf
	if bnf:
		velocity = position.direction_to(point2) * speed
		if position.distance_to(point2) < 1:
			position = point2
			return
	else:
		velocity = position.direction_to(point1) * speed
		if position.distance_to(point1) < 1:
			position = point1
			return
	position += velocity
