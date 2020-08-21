extends StaticBody2D

var opened = false
var inarea = false
onready var AnimationPlayer = $AnimationPlayer

func _process(delta):
	if Input.is_action_just_pressed("attack") && inarea && !opened:
		AnimationPlayer.play("opening")
		opened=true
		

func _on_Area2D_area_entered(area):
	inarea=true


func _on_Area2D_area_exited(area):
	inarea=false
