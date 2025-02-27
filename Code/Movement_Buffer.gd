extends Node2D

@onready var Player:CharacterBody2D = $".."

## -- FUNCTIONS -- ##
func get_input():
	var input_dir = Input.get_vector("left","right","up","down")
	Player.velocity = input_dir * Player.speed

func on_MouseDir()->void:
	var player_position = Player.global_position
	var mouse_dir = get_global_mouse_position()
	
	if player_position.x - mouse_dir.x <= 0:
		print("right?")
	else:
		print("left?")
