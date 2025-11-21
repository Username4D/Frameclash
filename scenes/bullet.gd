extends Area3D


func _physics_process(delta: float) -> void:
	self.position += Vector3(0.0,0.0,0.1).rotated(Vector3(0,1,0),self.rotation.y)
