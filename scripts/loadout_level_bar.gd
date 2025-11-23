extends Control

@export var state = 10
signal update
var prices = [5,10,15,20,25,35,45,75,150,300]

func _process(delta: float) -> void:
	$upgrade.text = "Upgrade: " + var_to_str(prices[state - 1]) + "$"
	if self.get_node("upgrade"):
		if $upgrade.button_pressed and save_handler.coins >= prices[state - 1]:
			$Polygon2D2.modulate = Color8(247,143,0)
		elif $upgrade.button_pressed:
			$Polygon2D2.modulate = Color8(255,50,0)
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

func _ready() -> void:
	$Label.text = self.name
	await get_tree().process_frame
	if state == 10:
		$upgrade.queue_free()
		await get_tree().process_frame
		$Polygon2D2.modulate = Color8(247,143,0)

func _on_upgrade_pressed() -> void:
	if save_handler.coins >= prices[state - 1]:
		state += 1
		if state == 10:
			$upgrade.queue_free()
			await get_tree().process_frame
			$Polygon2D2.modulate = Color8(247,143,0)
		update.emit()
		save_handler.coins -= prices[state - 2]
