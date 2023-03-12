extends CharacterBody2D


@export var max_speed := 200


func _physics_process(delta):
	var movement_vector = _get_movement_vector()
	var direction = movement_vector.normalized()
	velocity = direction * max_speed * (delta * 50)
	move_and_slide()


func _get_movement_vector() -> Vector2:
	return Input.get_vector(
		"move_left", 
		"move_right",
		"move_up",
		"move_down"
	)
