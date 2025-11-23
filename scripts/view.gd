extends Node2D

signal transition_ended

func blackscreen():
	$transition.start()
	while $transition.time_left != 0:
		await get_tree().process_frame
		$MeshInstance2D.modulate.a = 1 - $transition.time_left
	$MeshInstance2D.modulate.a = 1
	transition_ended.emit()
	$transition.start()
	while $transition.time_left != 0:
		await get_tree().process_frame
		$MeshInstance2D.modulate.a = $transition.time_left
	$MeshInstance2D.modulate.a = 0
