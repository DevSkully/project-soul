extends CharacterBody2D

const speed = 300.0
const JUMP_VELOCITY = -400.0

const bullet = preload("res://tscn/Object/bullet.tscn")

@onready var STATS:Node2D = $Stats

func _ready()->void:
	STATS.set_Health(120)
	STATS.set_Mana(100)

func get_input():
	var input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * speed

func shoot():
	var _bullet = bullet.instantiate()
	get_parent().add_child(_bullet)
	_bullet.global_position = $Marker2D.global_position
	
	var direction = (get_global_mouse_position() - global_position).normalized()
	_bullet.set_direction(direction)

func _physics_process(delta: float) -> void:
	get_input()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	move_and_slide()
