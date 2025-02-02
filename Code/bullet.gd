extends Area2D

var speed = 750.0
var direction = Vector2.ZERO

func _ready() -> void:
	if direction != Vector2.ZERO:
		rotation = direction.angle()

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
func set_direction(dir:Vector2):
	direction = dir.normalized()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
