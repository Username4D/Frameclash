extends NavigationAgent3D

@export var movement_speed: float = 0.75
@export var health =5


func _ready() -> void:
	self.velocity_computed.connect(Callable(_on_velocity_computed))
	update_position()
	$"../Label".max_value = health

func set_movement_target(movement_target: Vector3):
	self.set_target_position(movement_target)

func _physics_process(delta):
	$"../Label".value = health
	if $"../Label".max_value == health or health < 1:
		$"../Label".visible = false
	else:
		$"../Label".visible = true
	
	if health == 0:
		health -= 1
		$"../death_particles".emitting = true
		self.get_parent().velocity = Vector3(4, 5, 0).rotated(Vector3(0,1,0), randf_range(-PI, PI))
		self.get_parent().move_and_slide()
		$"..".set_collision_layer_value(2, true)
		$"..".set_collision_layer_value(1, false)
		$"..".set_collision_mask_value(2, true)
		$"..".set_collision_mask_value(1, false)
	if health == -1:
		self.get_parent().velocity.y -= 0.2
		self.get_parent().move_and_slide()
		if self.get_parent().is_on_floor():
			$"../CollisionShape3D".queue_free()
			die()
	if self.get_parent().get_parent().get_parent().get_node("player"):
		self.get_parent().get_node("Mesh").look_at(self.get_parent().get_parent().get_parent().get_node("player").position)
	# Do not query when the map has never synchronized and is empty.
	if NavigationServer3D.map_get_iteration_id(self.get_navigation_map()) == 0:
		return
	if self.is_navigation_finished():
		return

	var next_path_position: Vector3 = self.get_next_path_position()
	var new_velocity: Vector3 = self.get_parent().global_position.direction_to(next_path_position) * movement_speed
	if self.avoidance_enabled and health > 0 :
		self.set_velocity(new_velocity)
	elif health > 0:
		_on_velocity_computed(new_velocity)
	var own_pos = get_viewport().get_camera_3d().unproject_position(self.get_parent().position)
	self.get_parent().get_node("Label").position = own_pos - Vector2(64,64)

func _on_velocity_computed(safe_velocity: Vector3):
	self.get_parent().velocity = safe_velocity - Vector3(0,1,0)
	self.get_parent().move_and_slide()
	
func update_position():
	if self.get_parent().get_parent().get_parent().get_node("player"):
		set_movement_target(self.get_parent().get_parent().get_parent().get_node("player").global_position)

	get_tree().create_timer(0.1).timeout.connect(update_position)

func die():
	await get_tree().create_timer(0.5).timeout
	self.get_parent().queue_free()
