extends Node

var coins = 0
var damage_upgrades = 1
var firerate_upgrades = 1

var settings = {"vsync": false, "particles": true}

func s_load():
	var file = FileAccess.open("user://einenstern.dat", FileAccess.READ)
	if file:
		var content = file.get_var()
		coins = content["coins"]
		damage_upgrades = content["damage_upgrades"]
		firerate_upgrades = content["firerate_upgrades"]
		settings = content["settings"]

func s_save():
	var content = {"coins": coins, "damage_upgrades": damage_upgrades, "firerate_upgrades": firerate_upgrades, "settings": settings}
	var file = FileAccess.open("user://einenstern.dat", FileAccess.WRITE)
	file.store_var(content)

func _ready() -> void:
	s_load()
