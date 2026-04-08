extends Node2D

var homes : Array[Node]
var inactiveHomes : Array

func _ready() -> void:
	homes = get_tree().get_nodes_in_group("homes")
	inactiveHomes = homes
	print("number of homes: " + str(len(homes)))
	
	$CallTimer.wait_time = 6
	
	for i in len(homes):
		homes[i].answered.connect(_on_answered)
	
func _process(delta: float) -> void:

	
	inactiveHomes.append(homes.pop_front())
			
	
		
	#print(len(inactiveHomes))
		

func _on_answered(homePosition) -> void:
	print("answered!!!")
	$CallTimer.stop()
	$CallTimer.wait_time = 5
	$CallTimer.start()

#call timer is in charge of when a customer calls the phone
func _on_call_timer_timeout() -> void:
	
	#$CallTimer.wait_time = randi() % 20 + 1
	$CallTimer.wait_time = 10
	
	var notCallingList : Array
	
	for i in homes:
		print("home name: " + i.name)
		print("home connected? " + str(i.connected))
		print("home calling? " + str(i.isCalling))
		print("\n")
		if !i.connected and !i.isCalling:
			# if a home cannot be calling or connected, so its only good if both of these are false
			notCallingList.append(i)
	
	#picks a random house to start calling
	if (len(notCallingList) > 0):
		#var randomPick = randi() % len(notCallingList)
		notCallingList[randi() % len(notCallingList)].onCall()
	
	
	#inactiveHomes.pop_at(randomPick)
