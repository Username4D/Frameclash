extends Control



func _on_play_pressed() -> void:
	pass # Replace with function body.


func _on_loadout_pressed() -> void:
	self.get_parent().get_parent()._change_page("loadout")


func _on_settings_pressed() -> void:
	self.get_parent().get_parent()._change_page("settings")
