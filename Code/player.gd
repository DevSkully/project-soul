extends CharacterBody2D

signal experience_change
signal level_up

var maxExperience:int = 50
var Level:int = 1
var input_dir:Vector2

const speed = 300.0
const JUMP_VELOCITY = -400.0

const bullet = preload("res://tscn/Object/bullet.tscn")

@export var player_damage:int = 10
@export var experience:int = 0

@onready var STATS:Node2D = $Stats
@onready var CL:CanvasLayer = $Camera2D/CanvasLayer
@onready var anim_control:Node2D = $Animations

## ---- FUNCTION ---- ##
func _ready()->void:
	STATS.set_Health(120)
	STATS.set_Mana(100)
	CL.sudo_ready()

## -- GETTERS -- ##
func get_damage()->int:
	return player_damage
func get_input():
	input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * speed

## -- SETTERS -- ##
func set_Damage(damage:int)->void:
	self.player_damage = damage
func set_Level(level:int)->void:
	self.Level = level

## -- OTHER -- ##
func shoot():
	var _bullet = bullet.instantiate()
	add_child(_bullet)
	_bullet.global_position = $Marker2D.global_position
	var direction = (get_global_mouse_position() - global_position).normalized()
	_bullet.set_direction(direction)
func incrementExperience(exp:int)->void:
	experience += exp
	experience_change.emit()
func LevelUp()->void:
	experience = 0
	maxExperience += maxExperience / 2
	Level += 1
	level_up.emit()
func death()->void:
	anim_control.player_death()

## -- PROCESS -- ##
func _process(delta: float) -> void:
	if experience >= maxExperience:
		LevelUp()
func _physics_process(delta: float) -> void:
	get_input()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	move_and_slide()
