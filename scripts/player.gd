extends CharacterBody3D

const speed = 120

@export var bullet: PackedScene
@export var health = 10

var ldirection = Vector2.ZERO
func _physics_process(delta: float) -> void:
	if health:
		$hud.health = clamp(health, 0, 100000)
	if health > 0:
		var direction = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up").normalized()
		ldirection = ldirection.move_toward(direction, 2 * delta)
		velocity = Vector3(direction.x * speed * delta, velocity.y, direction.y * -1 * speed * delta)
		if direction.length_squared() > 0:
			var target_rotation = direction.angle()# - 0.5 * PI
			$MeshInstance3D.rotation.y = lerp_angle($MeshInstance3D.rotation.y, target_rotation, 0.2)
	elif health == 0:
		health = -1
		$death_particles.emitting = true
		self.velocity = Vector3(1, 4, 0).rotated(Vector3(0,1,0), randf_range(-PI, PI))
	else:
		velocity.z = move_toward(velocity.z, 0, delta * 0.2)
		velocity.x = move_toward(velocity.x, 0, delta * 0.2)
	velocity.y -= 2 * delta
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		var nbullet = bullet.instantiate()
		nbullet.position = self.position
		
		nbullet.rotation = $MeshInstance3D.rotation  + Vector3(0,0.5 * PI, 0)
		self.get_parent().add_child(nbullet)
