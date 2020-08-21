extends StaticBody2D

var inarea = false

func _process(delta):
	if Input.is_action_just_pressed("attack") && inarea:
		var RockBreakingEffect = load("res://Effects/Rock_breaking.tscn")
		var rockBreakingEffect = RockBreakingEffect.instance()
		var world = get_tree().current_scene
		world.add_child(rockBreakingEffect)
		rockBreakingEffect.global_position = global_position
		queue_free()

		



func _on_Area2D_area_entered(area):
	inarea=true


func _on_Area2D_area_exited(area):
	inarea=false
