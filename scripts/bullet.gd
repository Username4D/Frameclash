extends Area3D

@export var enemy = false
@export var speed = 0.1
@export var damage = 4

func _physics_process(delta: float) -> void:
	self.position += Vector3(0.0,0.0,speed).rotated(Vector3(0,1,0),self.rotation.y)

func _on_body_entered(body: Node3D) -> void:
	if enemy and body.is_in_group("player"):
		
		if body.health > 0:
			body.health -= damage
		self.queue_free()
	if not enemy and body.is_in_group("enemy"):
		if body.get_node("NavigationAgent3D").health > 0:
			body.get_node("NavigationAgent3D").health -= 1
		self.queue_free()
	
