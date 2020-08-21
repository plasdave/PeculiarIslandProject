extends Control
var tree

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	tree = get_tree()
	
func _on_BackButton_pressed():
	tree.change_scene("res://MainMenuScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
