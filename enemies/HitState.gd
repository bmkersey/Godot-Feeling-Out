extends State

class_name HitState

@export var damageable: Damageable
@export var char_state_machine: CharacterStateMachine
@export var deadState : State
@export var deadAnimationNode : String = 'death'
@export var knockback_velocity: Vector2 = Vector2(100,0)

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	character.velocity = knockback_velocity

func on_damageable_hit(node:Node, amount:int):
	if (damageable.health > 0):
		emit_signal("interruptState", self)
	else:
		emit_signal("interruptState", deadState)
		playback.travel(deadAnimationNode)
