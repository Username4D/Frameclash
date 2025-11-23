extends Control

@export var state = 10

func _process(delta: float) -> void:
	if $upgrade:
		if $upgrade.button_pressed:
			$Polygon2D2.modulate = Color8(247,143,0)
		else:
			$Polygon2D2.modulate = Color(255,255,255)
	else:
		$Polygon2D2.modulate = Color8(247,143,0)
	for i in range(0, $HBoxContainer.get_child_count()):
		var f = $HBoxContainer.get_child(i)

		if i + 1 <= state:
			f.modulate.v = 1
		else:

			f.modulate.v = 0


func _on_upgrade_pressed() -> void:
	state += 1
	if state == 10:
		$upgrade.queue_free()
		await get_tree().process_frame
		$Polygon2D2.modulate = Color8(247,143,0)
