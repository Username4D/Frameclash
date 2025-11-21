extends CharacterBody3D

const speed = 120

@export var bullet: PackedScene

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up").normalized()
	velocity = Vector3(direction.x * speed * delta, velocity.y, direction.y * -1 * speed * delta)
	if direction != Vector2(0,0):
		$MeshInstance3D.rotation.y = Vector2(0.0,0.0).angle_to_point(Vector2(direction.x, direction.y))
	print(Vector2(direction.x, direction.y))
	velocity.y -= 1 * delta
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var nbullet = bullet.instantiate()
		nbullet.position = self.position
		nbullet.rotation = $MeshInstance3D.rotation + Vector3(0, 0.5 * PI, 0)
		self.get_parent().add_child(nbullet)
