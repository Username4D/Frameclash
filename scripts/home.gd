extends Control



func _on_play_pressed() -> void:
	self.get_parent().get_parent().get_parent().get_parent().blackscreen()
	await self.get_parent().get_parent().get_parent().get_parent().transition_ended
	self.get_parent().get_parent().get_parent().get_parent().add_child(load("res://scenes/arena_scene.tscn").instantiate())
	self.get_parent().get_parent().get_parent().queue_free()


func _on_loadout_pressed() -> void:
	self.get_parent().get_parent()._change_page("loadout")


func _on_settings_pressed() -> void:
	self.get_parent().get_parent()._change_page("settings")
func open():
	$play.grab_focus()
