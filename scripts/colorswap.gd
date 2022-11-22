extends Node2D

export(Array) var levelexport # exports objects in an array because you cant normally export objects for some reason
var levelpack # the PackedScene for the current level
var level # the instance of the current level

var colors = [] # list of all the different colored rooms
export(int) var currentcolor # current colored room

export(NodePath) var player

var wheelvis = false
onready var uiscene = get_node("/root/Colorpickerui/buttons")

# Called when the node enters the scene tree for the first time.
func _ready():	
	levelpack = levelexport[0] # sets the PackedScene to the first object in level export
	level = levelpack.instance() # instances the scene to not bug loadlevel
	loadlevel(levelpack) # does sets up everything in using a PackedScene


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("colorui"):#pulls up color wheel ui
		wheelvis = true
		uiscene.show()
	if wheelvis == true:#if the color wheel ui is visible
		if Input.is_action_just_released("colorui"): #change color based on hover when released
			colorwheel()
			uiscene.hide()
			
	if Input.is_action_just_pressed("lvlz"):
		loadlevel(levelexport[0])
		print("aaa")
	if Input.is_action_just_pressed("lvlx"):
		loadlevel(levelexport[1])
		print("bbb")
	if Input.is_action_just_pressed("1"):
		print("red1")
		swapcolors(0)
	if Input.is_action_just_pressed("2"):
		print("yellow2")
		swapcolors(1)
	if Input.is_action_just_pressed("3"):
		print("green3")
		swapcolors(2)
	if Input.is_action_just_pressed("4"):
		print("blue4")
		swapcolors(3)
	if Input.is_action_just_pressed("5"):
		print("purple5")
		swapcolors(4)
			

func colorwheel(): 
	#checks if a button is hovered over when shift is released and swaps to it if so
	if uiscene.get_child(0).is_hovered():
		print("red")
		swapcolors(0)
		
	if uiscene.get_child(1).is_hovered():
		print("yellow")
		swapcolors(1)
		
	if uiscene.get_child(2).is_hovered():
		print("green")
		swapcolors(2)
		
	if uiscene.get_child(3).is_hovered():
		print("blue")
		swapcolors(3)
		
	if uiscene.get_child(4).is_hovered():
		print("purple")
		swapcolors(4)

func swapcolors(var new):
	colors[currentcolor].set_process(false) #deactivates scripts on old color
	colors[currentcolor].hide() # hides old color
	get_node(player).set_collision_mask_bit(currentcolor, false)
	
	colors[new].set_process(true) # activates new color
	colors[new].show() # makes new color visible
	get_node(player).set_collision_mask_bit(new, true)
	currentcolor = new # updates current
	
func loadlevel(var newlevel):
	levelpack = newlevel # updates level
	
	level.queue_free() # removes current level
	level = levelpack.instance() # instantiates the level and sets level to that
	add_child(level) # adds it as a child of main
	
	colors.clear() # resets colors list
	for i in range(5): # gets colors from level children
		colors.append(level.get_child(i))
		
	for col in colors: # deactivates all colors
		col.set_process(false)
		col.hide()
	colors[currentcolor].set_process(true) # sets a default color
	colors[currentcolor].show()
	
	get_node(player).set_collision_mask_bit(currentcolor, true)
	get_node(player).position = level.startpos
	swapcolors(0)
