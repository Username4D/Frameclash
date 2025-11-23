extends Node2D

@export var health = 10

func _process(delta: float) -> void:
	$live_display/Label.text = var_to_str(int(health))
	$wave_bar/ProgressBar.max_value = gameplay_info.max_enemies
	$wave_bar/ProgressBar.value = move_toward($wave_bar/ProgressBar.value, gameplay_info.enemies, 4 * delta)
