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
	var player_nodes := get_tree().get_nodes_in_group(Groups.PLAYER)
	if player_nodes.size() > 0:
		var player := player_nodes[0] as Node2D
		target_position = player.global_position
