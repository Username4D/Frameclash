extends Node2D

@export var open_page: Node
@export var last_page: Node

func _change_page(target):
	last_page = open_page
	$Timer.start()
	while $Timer.time_left != 0:
		await get_tree().process_frame
		open_page.position.x = 640 + 512 * (1 - $Timer.time_left * 4)
	open_page.position.x = 640 + 512
	open_page = $pages.get_node(target)
	$Timer.start()
	while $Timer.time_left != 0:
		await get_tree().process_frame
		open_page.position.x = 640 + 512 * $Timer.time_left * 4
	open_page.position.x = 640

func back():
	_change_page(String(last_page.name))
