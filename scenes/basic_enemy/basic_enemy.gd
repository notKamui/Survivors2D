extends CharacterBody2D

@export var max_speed := 75


func _process(delta: float):
	var direction = get_direction_to_player()
	velocity = direction * max_speed * Timing.process_delta(delta)
	move_and_slide()


func get_direction_to_player():
	var player_node := get_tree().get_first_node_in_group("player") as Node2D
	return (player_node.global_position - global_position).normalized()\
		if is_instance_valid(player_node)\
		else Vector2.ZERO
