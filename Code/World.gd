extends Node2D
#
#const enemy = preload("res://tscn/Object/Enemy.tscn")
#
#@onready var player = get_node("Player")
#@onready var camera = player.get_node("Camera2D")
#@onready var timer:Timer = $Timer
#
#var playerPosition:Vector2
#
#func _ready() -> void:
	#var tileSet = get_node("newTileSet")
	#print(tileSet.get_node('TileMap').get_used_rect().size)
#
#func _spawnEnemy()->Vector2:
	### CAMERA BOUNDS
	#var half_size = camera.get_viewport_rect().size / 2 / camera.zoom
	#var bounds = Rect2(camera.global_position - half_size, half_size*2)
	#var spawnPosition:Vector2 = Vector2.ZERO
	#return spawnPosition 
#
#func _process(delta: float) -> void:
	#pass
#
#func _on_timer_timeout() -> void:
	#var _instEnemy = enemy.instantiate()
	#_instEnemy.position = Vector2( randf_range(0,2162),randf_range(0,1194) )
	#_instEnemy.set_player(get_node("Player"))
	#self.add_child(_instEnemy)
