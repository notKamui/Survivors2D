extends CharacterBody2D

@export var max_speed := 200


func _process(delta: float):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity = direction * max_speed * Timing.process_delta(delta)
	move_and_slide()


func get_movement_vector() -> Vector2:
	return Input.get_vector(
		"move_left", 
		"move_right",
		"move_up",
		"move_down"
	)
