extends RigidBody2D

var startpos = [548,460]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	goback()

func goback():
	position.x = startpos[0]
	position.y = startpos[1]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
