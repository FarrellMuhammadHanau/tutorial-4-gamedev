extends Node2D

@export var obstacle : PackedScene
@onready var player = get_parent().get_node("Player")

var different_y : int
func _ready():
	different_y = global_position.y - player.global_position.y
	repeat()

func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child.call_deferred(spawned)
	
	var spawn_pos = global_position
	var player_pos = player.global_position
	spawn_pos.x = player_pos.x + randf_range(-500, 500)
	spawn_pos.y = player_pos.y + different_y

	spawned.global_position = spawn_pos
	
func repeat():
	spawn()
	await get_tree().create_timer(1).timeout
	repeat()
