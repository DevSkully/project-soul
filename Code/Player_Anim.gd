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
func flip(direction:Vector2, mouse_pos:Vector2,player_pos:Vector2)->void:
	if player.on_Direction_look:
		if direction.x == -1:
			player_sheet.flip_h = true
		else:
			player_sheet.flip_h = false
	else:
		if player_pos.x - mouse_pos.x >= 0:
			player_sheet.flip_h = false
		else:
			player_sheet.flip_h = true

func is_moving()->void:
	if player.input_dir == Vector2.ZERO:
		animation.play("Idle")
	else:
		animation.play("Running")

## -- FUNCTION - PROCESS -- ##
func _process(delta: float) -> void:
	if player.STATS.get_Health() > 0:
		flip(player.input_dir, player.global_position, get_global_mouse_position())
		is_moving()
