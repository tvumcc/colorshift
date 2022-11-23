extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	rotation_degrees = 0
	look_at(get_global_mouse_position())
	rotation_degrees += 90
