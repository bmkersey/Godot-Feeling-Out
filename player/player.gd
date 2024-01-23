extends CharacterBody2D

const SPEED = 300
const ACCEL = 10.0

var input: Vector2
var is_player_facing_right = true

@onready var animationPlayer = $AnimationPlayer
@onready var sprite = $Sprite2D

func get_input():
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return input.normalized()

func update_animations(inputs):
	if inputs == Vector2(0,0):
		animationPlayer.play("idle")
	else:
		animationPlayer.play("run")

func _process(delta):
	var playerInput = get_input()
	velocity = lerp(velocity, playerInput * SPEED, delta*ACCEL)
	if playerInput.x !=0:
		sprite.flip_h = !sprite.flip_h
	move_and_slide()
	
	update_animations(playerInput)
func _physics_process(_delta):
	pass
