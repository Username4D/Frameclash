extends Node2D

@export var health = 10

func _process(delta: float) -> void:
	$live_display/Label.text = var_to_str(int(health))
