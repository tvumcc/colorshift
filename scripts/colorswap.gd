extends Node2D

export(Array) var levelexport # exports objects in an array because you cant normally export objects for some reason
var levelpack # the PackedScene for the current level
var level # the instance of the current level

var colors = [] # list of all the different colored rooms
export(int) var currentcolor # current colored room
var pointer

export(NodePath) var player

var wheelvis = false
onready var uiscene = get_node("/root/Colorpickerui/buttons")

# Called when the node enters the scene tree for the first time.
func _ready():	
	levelpack = levelexport[0] # sets the PackedScene to the first object in level export
	level = levelpack.instance() # instances the scene to not bug loadlevel
	loadlevel(levelpack) # does sets up everything in using a PackedScene
	pointer = uiscene.get_child(5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("colorui"):#pulls up color wheel ui
		uiscene.show()
	if Input.is_action_just_released("colorui"): #change color based on hover when released
		colorwheel()
		uiscene.hide()
	buttoninputs()
	
	if Input.is_action_just_pressed("lvlz"):
		loadlevel(levelexport[0])
		print("aaa")
	if Input.is_action_just_pressed("lvlx"):
		loadlevel(levelexport[1])
		print("bbb")
	
	
func buttoninputs():
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
	var r = pointer.rotation_degrees
	print(r)
	if uiscene.get_child(0).is_hovered() or (r > 0 and r < 75):
		print("red")
		swapcolors(0)
		
	if uiscene.get_child(1).is_hovered() or (r > 75 and r < 145):
		print("yellow")
		swapcolors(1)
		
	if uiscene.get_child(2).is_hovered() or (r > 145 and r < 215):
		print("green")
		swapcolors(2)
		
	if uiscene.get_child(3).is_hovered() or (r > 215 and r < 275) or r < -72:
		print("blue")
		swapcolors(3)
		
	if uiscene.get_child(4).is_hovered() or (r > -72 and r < 0):
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
	colors[0].set_process(true) # sets a default color
	colors[0].show()
	
	get_node(player).set_collision_mask_bit(currentcolor, true)
	get_node(player).position = level.startpos

func get_lvl_index(var l):
	var x = 0
	for vl  in levelexport:
		if l == vl:
			return x
		x += 1
	# not in
	return -1
			

func gonext(var oldlevel):
	var toload = get_lvl_index(oldlevel)
	var next = toload + 1
	if next >= len(levelexport)-1:
		print('overflow')
		endgame()
		return
	print(next, levelexport[next])
	loadlevel(levelexport[next])

func endgame():
	print('end of game')
	get_tree().quit()
	
	
	
