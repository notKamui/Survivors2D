extends Camera2D

var target_position := Vector2.ZERO


func _ready():
	make_current()


func _process(delta: float):
	acquire_target()
	global_position = global_position.lerp(
		target_position, 
		Timing.process_delta(delta, 5)
	)


func acquire_target():
	var player := get_tree().get_first_node_in_group(Groups.PLAYER) as Node2D
	if is_instance_valid(player):
		target_position = player.global_position
