extends Container
var tree

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	tree = get_tree()
	
func _on_ExitButton_pressed():
	tree.quit()
	
func _on_SettingsButton_pressed():
	tree.change_scene("res://SettingsScreen.tscn")
	
func _on_NewGameButton_pressed():
	tree.change_scene("res://World.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MarginContainer_resized():
	pass # Replace with function body.
