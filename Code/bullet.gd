extends Area2D
## CONST ##
const speed = 750.0
## VAR ##
var direction = Vector2.ZERO
## ONREADY ##
@onready var player = get_parent()
@onready var damage:int = player.get_damage()

## ---- FUNCTIONS ---- ##
# OTHER #
func set_direction(dir:Vector2):
	direction = dir.normalized()
func update_damage():
	pass
# READY #
func _ready() -> void:
	if direction != Vector2.ZERO:
		rotation = direction.angle()
# PROCESS #
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
# NODE FUNCTIONS #
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("mobs"): 
		body.STATS.take_damage(damage)
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
