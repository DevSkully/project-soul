extends Node2D

@onready var player_sheet:Sprite2D = $Sprite2D
@onready var animation:AnimationPlayer = $AnimationPlayer
@onready var player:CharacterBody2D = $".."

var _position:Vector2
var old_position:Vector2

## -- FUNCTION -- ##
func _ready() -> void:
	pass

func player_death()->void:
	animation.play("Death")
	await animation.animation_finished
	player.queue_free()

func flip()->void:
	if player.input_dir.x == -1:
		player_sheet.flip_h = true
	elif player.input_dir.x == 1:
		player_sheet.flip_h = false

func is_moving()->void:
	if player.input_dir == Vector2.ZERO:
		animation.play("Idle")
	else:
		animation.play("Running")

## -- FUNCTION - PROCESS -- ##
func _process(delta: float) -> void:
	flip()
	is_moving()
