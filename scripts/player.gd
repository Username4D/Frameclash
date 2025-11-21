extends CharacterBody3D

const speed = 120

@export var bullet: PackedScene
var ldirection = Vector2.ZERO
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up").normalized()
	ldirection = ldirection.move_toward(direction, 2 * delta)
	velocity = Vector3(direction.x * speed * delta, velocity.y, direction.y * -1 * speed * delta)
	$MeshInstance3D.look_at($MeshInstance3D.global_position + Vector3( - ldirection.x, 0, ldirection.y))
	
	velocity.y -= 1 * delta
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var nbullet = bullet.instantiate()
		nbullet.position = self.position
		
		nbullet.rotation = $MeshInstance3D.rotation 
		self.get_parent().add_child(nbullet)
