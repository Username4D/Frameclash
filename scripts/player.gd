extends CharacterBody3D

const speed = 120

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up").normalized()
	velocity = Vector3(direction.x * speed * delta, velocity.y, direction.y * -1 * speed * delta)
	velocity.y -= 1 * delta
	move_and_slide()
