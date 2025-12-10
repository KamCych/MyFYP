extends Node2D

var homes : Array[Node]
var inactiveHomes : Array

func _ready() -> void:
	homes = get_tree().get_nodes_in_group("homes")
	inactiveHomes = homes
	print("number of homes: " + str(len(homes)))
	
	$CallTimer.wait_time = randi() % 3 + 1
	
	for i in len(homes):
		homes[i].answered.connect(_on_answered)
	
func _process(delta: float) -> void:

	
		
			
	
		
	print(len(inactiveHomes))
		

func _on_answered() -> void:
	for i in len(homes):
		if !homes[i].isCalling:
			inactiveHomes.insert(i, homes[i])
	pass

func _on_call_timer_timeout() -> void:
	
	$CallTimer.wait_time = randi() % 3 + 1
	
	var randomPick = randi() % len(inactiveHomes)
	
	inactiveHomes[randomPick].isCalling = true
	inactiveHomes.pop_at(randomPick)
