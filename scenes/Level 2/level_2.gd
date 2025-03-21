extends Node2D


func _ready() -> void:
	var current_scene = get_tree().current_scene.scene_file_path
	current_scene = current_scene.replace("res://", "").replace(".tscn", "").replace("scenes/", "")
	if global.level != current_scene:
		global.lives = 3
	global.level = current_scene
	print(global.level)
