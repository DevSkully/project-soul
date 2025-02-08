extends Node2D

const enemy = preload("res://tscn/Object/Enemy.tscn")

@onready var player = get_node("Player")

func _spawnEnemy()->void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("EnemySpawn"):
		var _instEnemy = enemy.instantiate()
		self.add_child(_instEnemy)
		_instEnemy.set_player(get_node("Player"))
		print("enemy spawned")


func _on_timer_timeout() -> void:
	var _instEnemy = enemy.instantiate()
	_instEnemy.position = Vector2( randf_range(0,player.global_positon),randf_range(0,player.global_positon) )
	self.add_child(_instEnemy)
