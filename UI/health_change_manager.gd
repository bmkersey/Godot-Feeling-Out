extends Control

@export var floatingCombatText : PackedScene
@export var damageColor: Color = Color.CRIMSON
@export var healColor: Color = Color.LIME

func _ready():
	SignalBus.connect("on_health_changed", on_signal_health_changed)
	



func on_signal_health_changed(node:Node, amount:int):
	var floatingCombatTextInstance: Label = floatingCombatText.instantiate()
	node.add_child(floatingCombatTextInstance)
	floatingCombatTextInstance.text = str(amount)
	if (amount >= 0):
		floatingCombatTextInstance.modulate = healColor
	else:
		floatingCombatTextInstance.modulate = damageColor
