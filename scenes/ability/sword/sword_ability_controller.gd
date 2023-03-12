extends Node

@export var sword_ability: PackedScene


func _on_timer_timeout():
	var player := get_tree().get_first_node_in_group("player") as Node2D
	if not is_instance_valid(player):
		return
		
	var sword := sword_ability.instantiate() as Node2D
	player.get_parent().add_child(sword)
	sword.global_position = player.global_position
