extends RigidBody2D

var speed:float = 200
var player:CharacterBody2D

@onready var STATS:Node2D = $Stats

func _init() -> void:
	global_position = Vector2(200,200)

func _ready() -> void:
	STATS.set_Health(20)
	lock_rotation = true

func set_player(CharacterBody2D)->void:
	player = CharacterBody2D

func _physics_process(delta: float) -> void:
	if player!=null :
		var direction = (player.global_position - global_position).normalized()
		set_linear_velocity(direction*speed)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" :
		body.STATS.take_damage(10)
		queue_free()
