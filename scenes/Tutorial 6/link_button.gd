extends LinkButton

@export var scene_to_load: String

func _on_pressed():
	global.lives = 3
	if scene_to_load == "Restart":
		scene_to_load = global.level
	elif scene_to_load == "Menu":
		scene_to_load = "Tutorial 6/MainMenu"
	elif scene_to_load == "New Game":
		scene_to_load = "Level1"
	get_tree().call_deferred("change_scene_to_file", "res://scenes/" + scene_to_load + ".tscn")
