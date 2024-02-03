extends Area2D

@export var damage: int = 10
@export var player: Player
@export var facing_collision_shape_2d : Attack_1_Collision_2D
func _ready():
	monitoring = false
	player.connect("facing_direction_changed", _on_player_facing_direction_changed)
func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)

func _on_player_facing_direction_changed(is_player_facing_right: bool):
	if (is_player_facing_right):
		facing_collision_shape_2d.position =facing_collision_shape_2d.facing_right_pos
	else:
		facing_collision_shape_2d.position = facing_collision_shape_2d.facing_left_pos
