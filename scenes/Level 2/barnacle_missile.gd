extends CharacterBody2D

@onready var player = get_parent().get_node("Player")
@export var acceleration = 1000

var angle: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_pos = player.global_position
	var start_pos = global_position
	var relative_pos = start_pos - player_pos
	angle = relative_pos.angle()
	rotation = angle + PI/2

func _physics_process(delta):
	velocity.x += delta * acceleration * cos(angle) * -1
	velocity.y += delta * acceleration * sin(angle) * -1
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
