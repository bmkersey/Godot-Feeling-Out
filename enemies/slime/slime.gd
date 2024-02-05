extends CharacterBody2D

@onready var animationTree : AnimationTree = $AnimationTree
@onready var stateMachine: CharacterStateMachine = $CharacterStateMachine

func _ready():
	animationTree.active = true

func _physics_process(delta):
	move_and_slide()
