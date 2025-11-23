extends CharacterBody3D

var bullet = preload("res://scenes/bullet.tscn")

func shoot():
	
	var shot_l = bullet.instantiate()
	shot_l.transform = $Mesh/front_shot.global_transform
	shot_l.enemy = true
	shot_l.damage = 1
	shot_l.speed = 0.05
	self.get_parent().get_parent().add_child(shot_l)

	await get_tree().create_timer(0.65).timeout.connect(shoot)

func _ready() -> void:
	shoot()
