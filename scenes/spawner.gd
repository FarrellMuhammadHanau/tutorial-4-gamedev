extends Node2D

@export var obstacle : PackedScene

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child.call_deferred(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + randf_range(0, 0)

	spawned.global_position = spawn_pos
	
func repeat():
	spawn()
	await get_tree().create_timer(0.8).timeout
	repeat()
