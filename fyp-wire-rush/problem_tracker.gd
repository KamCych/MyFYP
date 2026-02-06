extends Node

var current_home_problem
var homes : Array[Node]

func _ready() -> void:
	homes = get_tree().get_nodes_in_group("homes")
	
	for i in len(homes):
		homes[i].selected.connect(_on_home_selected)


func _on_home_selected(selectedProblem):
	current_home_problem = selectedProblem


func _on_option_controls_picked_choice(option: Variant) -> void:
	print(option)
	if option == current_home_problem:
		print("OPTION MATCHES IOSSUE")
