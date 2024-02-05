extends State

class_name Walk

@export var move_speed:=100.0
@export var move_direction:Vector2
@export var wander_time:float
@export var pursueState : State

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time = randf_range(2,4)

func on_enter():
	set_physics_process(true)
	randomize_wander()

func on_exit():
	set_physics_process(false)

func state_process(delta):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
		
func _physics_process(delta):
	print("wander physics")
	if character:
		character.velocity = move_direction * move_speed


func _on_detection_area_body_entered(body):
	if body is Player:
		emit_signal("interruptState", pursueState)
