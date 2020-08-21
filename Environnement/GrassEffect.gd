extends Node2D

onready var animatedSprite = $AnimatedSprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	animatedSprite.frame=0
	animatedSprite.play("Animate")

#func _process(delta):
#	if Input.is_action_just_pressed("attack"):
#		animatedSprite.play("Animate")

func _on_AnimatedSprite_animation_finished():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
