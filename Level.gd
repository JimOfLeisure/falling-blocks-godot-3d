extends Spatial

const NUMBLOCKS = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var MyBoxClass = load("res://SelfManagedBox.gd")
	for _x in range(NUMBLOCKS):
		var my_box = MyBoxClass.new()
		add_child(my_box)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
