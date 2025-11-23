extends Control



func _ready() -> void:
	$Firerate.state = save_handler.firerate_upgrades
	$Damage.state = save_handler.damage_upgrades

func _on_update() -> void:
	save_handler.firerate_upgrades = $Firerate.state
	save_handler.damage_upgrades = $Damage.state
	print("update")
	save_handler.s_save()
