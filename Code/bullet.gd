extends Area2D
## CONST ##
const speed = 750.0
## VAR ##
var direction = Vector2.ZERO
## ONREADY ##
@onready var damage:int = get_parent().get_damage()

## ---- FUNCTIONS ---- ##
func _ready() -> void:
	if direction != Vector2.ZERO:
		rotation = direction.angle()

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func set_direction(dir:Vector2):
	direction = dir.normalized()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Enemy": 
		body.STATS.take_damage(damage)
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
