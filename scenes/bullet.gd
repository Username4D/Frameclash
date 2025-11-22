extends Area3D

@export var enemy = false
@export var speed = 0.1

func _physics_process(delta: float) -> void:
	self.position += Vector3(0.0,0.0,speed).rotated(Vector3(0,1,0),self.rotation.y)
