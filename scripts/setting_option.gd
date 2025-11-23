extends Control

@export var state = true

func _process(delta: float) -> void:
	$check_bg2.visible = $Button.button_pressed

func _ready() -> void:
	$Button.button_pressed = state
	$Label.text = self.name + ":"
