extends StaticBody2D

var breaking_state=1
var inarea = false
onready var sprite = $Sprite

func _process(delta):
	if Input.is_action_just_pressed("attack") && inarea:
		if breaking_state>=3:	#au 5eme coup
			var RockBreakingEffect = load("res://Effects/Rock_breaking.tscn")
			var rockBreakingEffect = RockBreakingEffect.instance()
			var world = get_tree().current_scene
			world.add_child(rockBreakingEffect)
			rockBreakingEffect.global_position = global_position
			queue_free()
		else:
			breaking()
		

func breaking():
	sprite.set_frame(breaking_state)
	breaking_state+=1
	pass

func _on_Area2D_area_entered(area):
	inarea=true


func _on_Area2D_area_exited(area):
	inarea=false
