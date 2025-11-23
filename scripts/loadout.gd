extends Control



func _ready() -> void:
	$Firerate.state = save_handler.firerate_upgrades
	$Damage.state = save_handler.damage_upgrades
	$Label2.text = "Coins: " + var_to_str(save_handler.coins) + "$"
func _on_update() -> void:
	$Label2.text = "Coins: " + var_to_str(save_handler.coins) + "$"
	save_handler.firerate_upgrades = $Firerate.state
	save_handler.damage_upgrades = $Damage.state
	print("update")
	save_handler.s_save()
