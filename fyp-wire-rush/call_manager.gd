extends Node2D

func _ready() -> void:
	var homes = get_tree().get_nodes_in_group("homes")
	
	print("number of homes: " + str(len(homes)))
