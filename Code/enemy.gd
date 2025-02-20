extends RigidBody2D

const speed:float = 200
var player:CharacterBody2D

@onready var STATS:Node2D = $Stats
@export var damage:int = 10
@export var soul:PackedScene

func _ready() -> void:
	STATS.set_Health(20)
	lock_rotation = true

func set_player(CharacterBody2D)->void:
	player = CharacterBody2D
func set_soul(Resource)->void:
	soul = Resource

func death()->void:
	if soul:
		var _instDrop = soul.instantiate()
		_instDrop.global_position = global_position
		get_parent().add_child(_instDrop)
	queue_free()

func _physics_process(delta: float) -> void:
	if player!=null :
		var direction = (player.global_position - global_position).normalized()
		set_linear_velocity(direction*speed)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" :
		print(player.STATS.get_Health())
		body.STATS.take_damage(damage)
		queue_free()
