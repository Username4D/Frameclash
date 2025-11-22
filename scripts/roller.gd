extends CharacterBody3D

var bullet = preload("res://scenes/roller_bullet.tscn")

func shoot():
	var shot_l = bullet.instantiate()
	shot_l.transform = $Mesh/shoot_1.global_transform
	shot_l.speed = 0.04
	self.get_parent().get_parent().add_child(shot_l)
	await get_tree().create_timer(1.4).timeout
	var shot_r = bullet.instantiate()
	shot_r.transform = $Mesh/shoot_2.global_transform
	shot_r.speed = 0.04
	self.get_parent().get_parent().add_child(shot_r)
	await get_tree().create_timer(1.4).timeout.connect(shoot)

func _ready() -> void:
	shoot()
