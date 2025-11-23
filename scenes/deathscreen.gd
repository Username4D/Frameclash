extends Node2D

func _ready() -> void:
	await get_tree().create_timer(3).timeout
	$Timer.start()
	while $Timer.time_left != 0:
		await get_tree().process_frame
		self.modulate.a = 1 - $Timer.time_left
	self.modulate.a = 1
	$play.grab_focus()

func _on_play_pressed() -> void:
	self.get_parent().get_parent().blackscreen()
	await self.get_parent().get_parent().transition_ended
	self.get_parent().get_parent().add_child(load("res://scenes/main_menu.tscn").instantiate())
	save_handler.s_save()
	self.get_parent().queue_free()
		
