extends CharacterBody2D

class_name Player

@export var speed: int = 400
@export var gravity: int = 1200
@export var jump_speed: int = -400
@export var health: int = 3
@export var heart_scene : PackedScene

@onready var health_bar = $HealthBar
var hearts = []

func take_damage():
	health -= 1
	var heart = hearts.pop_back()
	heart.queue_free()
	
func _ready():
	for i in range(health):
		var heart = heart_scene.instantiate()
		health_bar.add_child(heart)
		heart.position = Vector2(i * 50, 0)
		hearts.append(heart)		

func get_input():
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed


func _physics_process(delta):
	velocity.y += delta * gravity
	get_input()
	move_and_slide()


func _process(_delta):
	if not is_on_floor():
		$Animator.play("Jump")
	elif velocity.x != 0:
		$Animator.play("Walk")
	else:
		$Animator.play("Idle")

	if velocity.x != 0:
		if velocity.x > 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
