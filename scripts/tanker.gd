extends CharacterBody3D

var bullet = preload("res://scenes/bomb.tscn")

func shoot():
	for i in range(1,5):
		var shot_l = bullet.instantiate()
		shot_l.transform = $Mesh/front_shot.global_transform
		self.get_parent().get_parent().add_child(shot_l)
		await get_tree().create_timer(0.3).timeout
	await get_tree().create_timer(1.4).timeout.connect(shoot)

func _ready() -> void:
	shoot()
