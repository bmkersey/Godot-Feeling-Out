extends State

class_name GroundState
@export var attack_state: State
@export var attack_animation: String = "attack"

func state_process(delta):
	pass
	
func state_input(event:InputEvent):
	if(event.is_action_pressed("attack")):
		attack()


func attack():
	next_state = attack_state
	playback.travel(attack_animation)
