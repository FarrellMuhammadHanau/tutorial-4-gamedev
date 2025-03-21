extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var current_scene = get_tree().current_scene.scene_file_path
	current_scene = current_scene.replace("res://", "").replace(".tscn", "").replace("scenes/", "")
	global.level = current_scene
