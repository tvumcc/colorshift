extends Node2D



export(Array) var colors # list of all the different colored rooms
export(int) var currentcolor # current colored room
export(NodePath) var player 


# Called when the node enters the scene tree for the first time.
func _ready():

	for col in colors:
		get_node(col).set_process(false)
	get_node(colors[currentcolor]).set_process(true) # sets a default color
	get_node(colors[currentcolor]).show()
	get_node(player).collision_layer = currentcolor + 1
	get_node(player).collision_mask = currentcolor + 1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(get_node(player).collision_layer)
	print(get_node(player).collision_mask)
	tempnuminputs()
	
func tempnuminputs():
	if Input.is_action_pressed("1"):
		swapcolors(0)
	if Input.is_action_pressed("2"):
		swapcolors(1)
	if Input.is_action_pressed("3"):
		swapcolors(2)
	if Input.is_action_pressed("4"):
		swapcolors(3)
	if Input.is_action_pressed("5"):
		swapcolors(4)

func swapcolors(var new):
	get_node(colors[currentcolor]).set_process(false) #deactivates scripts on old color
	get_node(colors[currentcolor]).hide() # hides old color
	get_node(colors[new]).set_process(true) # activates new color
	get_node(colors[new]).show() # makes new color visible
	currentcolor = new # updates current
	get_node(player).collision_layer = currentcolor + 1
	get_node(player).collision_mask = currentcolor + 1

