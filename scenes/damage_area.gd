extends Area2D

@export var sceneName = "LoseScreen"

func _on_body_entered(body: Node) -> void:
	if body.get_name() == "Player":
		body.take_damage()
		if body.health <= 0:
			get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
			
	get_parent().queue_free()
