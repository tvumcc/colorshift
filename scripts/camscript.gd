extends Camera2D


var playerpos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func rebound(var bounds):
	limit_left = bounds[0]
	limit_top = bounds[1]
	limit_right = bounds[2]
	limit_bottom = bounds[3]
