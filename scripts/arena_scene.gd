extends Node3D

var wave = 0

var rng = RandomNumberGenerator.new()

var enemies = [preload("res://scenes/tanker.tscn"), preload("res://scenes/roller.tscn"), preload("res://scenes/soldier.tscn")]
var single_trigger = false
func _ready() -> void:
	start_wave()

func start_wave():
	rng.randomize()
	single_trigger = false
	wave += 1
	gameplay_info.max_enemies = pow(2, wave)
	$Label.text = "Wave " + var_to_str(wave)
	$wave_display.start()
	while $wave_display.time_left != 0:
		await get_tree().process_frame
		$Label.position.x = -1152 + 2 * 1152 * ease($wave_display.time_left / 3, -0.2)
	
	for i in range(0, pow(2, wave), 1):
		var select = rng.randi_range(0,2)
		var obj = enemies[select].instantiate()
		obj.position = Vector3(rng.randi_range(-16, 16), 5, rng.randi_range(-16, 16))
		$enemies.add_child(obj)
	single_trigger = true
func _process(delta: float) -> void:
	gameplay_info.enemies = $enemies.get_child_count()
	if $enemies.get_child_count() == 0 and single_trigger:
		start_wave()
