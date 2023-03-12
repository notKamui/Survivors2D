extends CharacterBody2D

@export var max_speed := 200

func _process(delta):
	pass

func _get_movement_vector() -> Vector2:
	return Input.get_vector(
		"move_left", 
		"move_right",
		"move_down",
		"move_up"
	)
