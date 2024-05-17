extends Node2D


var item_scenes := [
	preload("health.tscn")
]

func _ready() -> void:
	var health_scene := preload("health.tscn")
	var health_instance := health_scene.instantiate()
	add_child(health_instance)
	get_node("Timer").timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	var random_item_scene: PackedScene = item_scenes.pick_random()
	var item_instance := random_item_scene.instantiate()
	add_child(item_instance)
	
	var viewport_size := get_viewport_rect().size
	var random_position := Vector2(0, 0)
	random_position.x = randf_range(0, viewport_size.x)
	random_position.y = randf_range(0, viewport_size.y)
	item_instance.position = random_position
