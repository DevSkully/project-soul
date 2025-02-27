extends Node

###################
## - FUNCTIONS - ##
###################
func get_Input()->Vector2:
	return Input.get_vector("left","right","up","down")
func face_direction(self_position:Vector2, mouse_position:Vector2, sprite:Sprite2D)->void:
	if self_position.x - mouse_position.x || self_position.x == -1:
		sprite.flip_h = true
	else :
		sprite.flip_h = false
