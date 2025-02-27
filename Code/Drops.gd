extends Area2D

@onready var player:CharacterBody2D = get_parent().get_node("Player")
var distance:Vector2 = Vector2.ZERO
var _delta:float
var movable:bool

## TEXTURES ##
@onready var low_expDrop = "res://Assets/Dark-Soul.png"
@onready var medium_expDrop = "res://Assets/Yellow-Soul.png"
@onready var high_expDrop = "res://Assets/Red-Soul.png"

func _ready() -> void:
	if player==null:
		queue_free()

func _process(delta: float) -> void:
	if player != null:
		distance = (player.global_position - global_position)
	if movable == true:
		_move(distance, delta)

func _move(distance:Vector2, delta:float)->void:
	var direction = distance.normalized()
	position += direction * 250 * delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" : 
		body.incrementExperience(10)
		queue_free()

func _on_pick_up_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		movable = true

func _on_pick_up_area_body_exited(body: Node2D) -> void:
	movable = false
