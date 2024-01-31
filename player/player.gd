extends CharacterBody2D

const SPEED = 300
const ACCEL = 10.0

var input: Vector2
var is_player_facing_right = true
@onready var state_machine:CharacterStateMachine = $CharacterStateMachine
@onready var animationPlayer = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var animationTree = $AnimationTree
func get_input():
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return input.normalized()

func update_animations(inputs):
	print(inputs)
	animationTree.set("parameters/Move/blend_position", inputs)
func _ready():
	animationTree.active = true
#func _process(delta):
	#var playerInput = get_input()
	#velocity = lerp(velocity, playerInput * SPEED, delta*ACCEL)
	#if playerInput.x !=0:
		#sprite.flip_h = !sprite.flip_h
	#move_and_slide()
	
func _physics_process(delta):
	var playerInput = get_input()
	if state_machine.check_if_can_move():
		velocity = lerp(velocity, playerInput * SPEED, delta*ACCEL)
	
	if playerInput.x !=0 && state_machine.check_if_can_move():
		if playerInput.x < 0 && !sprite.flip_h:
			sprite.flip_h = true
		if playerInput.x > 0 && sprite.flip_h:
			sprite.flip_h = false
	move_and_slide()
	
	update_animations(playerInput)
