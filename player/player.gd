extends CharacterBody2D

var player_speed = 200

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up", "move_down")
	velocity = direction * player_speed
	if velocity != Vector2(0,0):
		$AnimatedSprite2D.play("walk")
		move_and_slide()
	else:
		$AnimatedSprite2D.play("idle")
