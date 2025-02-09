extends CharacterBody2D

const speed = 300.0
const JUMP_VELOCITY = -400.0

const bullet = preload("res://tscn/Object/bullet.tscn")

var player_damage:int = 10
var experience:float

@onready var STATS:Node2D = $Stats

## ---- FUNCTION ---- ##
func _ready()->void:
	STATS.set_Health(120)
	STATS.set_Mana(100)
## -- GETTERS -- ##
func get_Experience()->float:
	return experience
func get_damage()->int:
	return player_damage
func get_input():
	var input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * speed
## -- SETTERS -- ##
func set_Experience(float)->void:
	experience = float
func set_Damage(int)->void:
	player_damage = int

## -- OTHER -- ##
func shoot():
	var _bullet = bullet.instantiate()
	add_child(_bullet)
	_bullet.global_position = $Marker2D.global_position
	var direction = (get_global_mouse_position() - global_position).normalized()
	_bullet.set_direction(direction)
func incrementExperience(int)->void:
	experience += int
func death()->void:
	queue_free()

## -- PROCESS -- ##
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	get_input()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	move_and_slide()
