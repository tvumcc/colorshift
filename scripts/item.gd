extends RigidBody2D

export(Vector2) var startpos

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	goback()

func goback():
	position = startpos


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
