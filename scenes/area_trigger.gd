extends Area2D

@export var sceneName: String = "Level 1"


func _on_body_entered(body: Node) -> void:
	var current_scene = get_tree().get_current_scene().scene_file_path
	current_scene = current_scene.replace("res://", "").replace(".tscn", "").replace("scenes/", "")
	if body.get_name() == "Player":
		if current_scene == sceneName:
			global.lives -=1
		if (global.lives == 0):
			get_tree().call_deferred("change_scene_to_file", str("res://scenes/Tutorial 6/Game Over.tscn"))
		else:
			get_tree().call_deferred("change_scene_to_file",(str("res://scenes/" + sceneName + ".tscn")))
