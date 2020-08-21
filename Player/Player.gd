extends KinematicBody2D


enum{
	MOVE,
	ROLL,
	ATTACK	
}
# Declare member variables here. Examples:
var state = MOVE
var velocity = Vector2.ZERO
const MAX_SPEED = 90
const ACCELERATION = 100
const FRICTION = 350

# Called when the node enters the scene tree for the first time.

func _ready():
	animationTree.active=true
#	print('Here goes the hero.');
#	pass # Replace with function body.

onready var animationPlayer =$AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):	#loop for every physic update
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			pass
		ATTACK:
			attack_state(delta)
	
func move_state(delta):	
	var input_vector = Vector2.ZERO
	input_vector.x= Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y= Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	input_vector=input_vector.normalized()
	
	if input_vector!= Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walking/blend_position", input_vector)
		animationTree.set("parameters/Attacking/blend_position", input_vector)
		animationState.travel("Walking")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		#velocity += input_vector * ACCELERATION * delta
		#velocity = velocity.clamped(MAX_SPEED) * delta
	else:
		animationState.travel("Idle")
		velocity=velocity.move_toward(Vector2.ZERO, FRICTION*delta)
		
#	move_and_collide(velocity * delta)  # cogne mur et s'arrête
#   move_and_slide(velocity) 			# cogne mur et glisse dessu (si coté penché V, appuy sur haut, va longer bord horitontalement)
	velocity = move_and_slide(velocity)	# // et empêche de bloquer entre ViciV
	
	if Input.is_action_pressed("attack"):
		state=ATTACK

func attack_state(delta):
	velocity=Vector2.ZERO
	animationState.travel("Attacking")

func attack_animation_finished():
	state=MOVE


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
