extends Area2D

@export var sceneName = "LoseScreen"

func _on_body_entered(body: Node) -> void:
	if body.get_name() == "Player":
		global.lives -= 1
		if global.lives <= 0:
			get_tree().call_deferred("change_scene_to_file", str("res://scenes/" + sceneName + ".tscn"))
			
	get_parent().queue_free()
