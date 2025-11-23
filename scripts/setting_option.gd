extends Control

@export var init = false
@export var state = true
@export var setting = "s"

func _process(delta: float) -> void:
	$check_bg2.visible = $Button.button_pressed
	if init:
		state = $Button.button_pressed

func _ready() -> void:
	await get_tree().process_frame
	$Button.button_pressed = state
	$Label.text = self.name + ":"



func _on_button_pressed() -> void:
	save_handler.settings[setting] =  not state
	print(save_handler.settings[setting])
	save_handler.s_save()
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if save_handler.settings["vsync"] else DisplayServer.VSYNC_DISABLED)
