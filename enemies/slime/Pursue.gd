extends State

class_name Pursue

var player: Player
var original_position: Vector2
var direction: Vector2
@export var move_speed=150.0
@export var walk_state: State

# Called when the node enters the scene tree for the first time.
func on_enter():
	set_physics_process(true)
	player = get_tree().get_first_node_in_group("Player")
	original_position = character.global_position

func on_exit():
	set_physics_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if character && player:
		direction = (player.global_position - character.global_position).normalized()
		character.velocity = direction * move_speed


func _on_detection_area_body_exited(body):
	if body is Player:
		print(body.name)
		emit_signal("interruptState", walk_state)
