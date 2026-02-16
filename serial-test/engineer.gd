extends CharacterBody2D

var sentOut = false
var homeTarget

var newHQ



func _physics_process(delta: float) -> void:
	
	if sentOut:
		#get_node("HQ").engineerCall.connect(_on_engineer_call)
		
		velocity = global_position.direction_to(homeTarget) * 40
		#print(velocity)
		
		move_and_slide()

func _on_engineer_call(target):
	print("Calling engineer")
	homeTarget = target
	sentOut = true
