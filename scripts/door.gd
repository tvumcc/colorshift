extends RigidBody2D

export(int) var neededkeys = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_door_body_entered(body):
	neededkeys -= 1
	$"/root/Main/Prism/Hand".drop()
	body.queue_free()
	$"/root/Main/Prism/Hand".holding = false
	if neededkeys == 0:
		position = Vector2(99999,99999)
