extends RigidBody3D

var explosion = preload("res://scenes/explosion.tscn")

func _ready() -> void:
	apply_central_force(Vector3(0.0,130,370).rotated(Vector3(0,1,0),self.rotation.y))
	print((Vector3(0.0,0.0,100).rotated(Vector3(0,1,0),self.rotation.y)))


func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var on_floor: bool = false
	var i := 0
	while i < state.get_contact_count():
		var normal := state.get_contact_local_normal(i)
		on_floor = normal.dot(Vector3.UP) > 0.99 # this can be dialed in
		
		i += 1
	if on_floor:
		var exp = explosion.instantiate()
		exp.position = self.position
		self.get_parent().add_child(exp)
		print(exp)
		await get_tree().process_frame
		self.queue_free()
