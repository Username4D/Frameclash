extends Area3D



func _ready() -> void:
	self.scale.x = 0.01
	self.scale.y = 0.01

func _process(delta: float) -> void:
	self.scale.x = (1 - $Timer.time_left / 2) * 5
	self.scale.z = (1 - $Timer.time_left / 2) * 5
	if not $Timer.is_stopped():
		$MeshInstance3D2.mesh.material.albedo_color.a = clampf($Timer.time_left / 2 , 0, 20)
		$MeshInstance3D2/MeshInstance3D3.mesh.material.albedo_color.a =clampf($Timer.time_left / 2, 0, 20)




func _on_timer_timeout() -> void:

	self.queue_free()


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		if body.health > 0:
			body.health -=1 
