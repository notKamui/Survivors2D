extends Node

@export var sword_ability: PackedScene
@export var max_range := 150.0

func _on_timer_timeout():
	var player := get_tree().get_first_node_in_group(Groups.PLAYER) as Node2D
	if not is_instance_valid(player):
		return
	
	var enemies := get_tree().get_nodes_in_group(Groups.ENEMY)
	enemies = enemies.filter(func(enemy: Node2D):
		return enemy.global_position.distance_squared_to(player.global_position) < max_range * max_range
	)
	if enemies.size() == 0:
		return
		
	enemies.sort_custom(func(a: Node2D, b: Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance
	)
		
	var sword := sword_ability.instantiate() as Node2D
	var closest_enemy := enemies[0] as Node2D
	player.get_parent().add_child(sword)
	sword.global_position = closest_enemy.global_position
	
