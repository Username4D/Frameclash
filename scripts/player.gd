extends CharacterBody3D

const speed = 120

@export var bullet: PackedScene
var ldirection = Vector2.ZERO
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up").normalized()
	ldirection = ldirection.move_toward(direction, 2 * delta)
	velocity = Vector3(direction.x * speed * delta, velocity.y, direction.y * -1 * speed * delta)
	if direction.length_squared() > 0:
		var target_rotation = direction.angle()# - 0.5 * PI
		$MeshInstance3D.rotation.y = lerp_angle($MeshInstance3D.rotation.y, target_rotation, 0.2)
	velocity.y -= 1 * delta
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		var nbullet = bullet.instantiate()
		nbullet.position = self.position
		
		nbullet.rotation = $MeshInstance3D.rotation  + Vector3(0,0.5 * PI, 0)
		self.get_parent().add_child(nbullet)
