extends Control

func open():
	$back.grab_focus()

func _ready() -> void:
	$"V-SYNC ENABLED".state = save_handler.settings["vsync"]
	$PARTICLES.state = save_handler.settings["particles"]
	$"V-SYNC ENABLED".init = true
	$PARTICLES.init = true
	print(save_handler.settings)
