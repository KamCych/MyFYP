extends CharacterBody2D

var sentOut = false
var homeTarget

var newHQ



func _physics_process(delta: float) -> void:
	
	if sentOut:
		get_node("HQ").engineerCall.connect(_on_engineer_call)
		
		velocity = position.direction_to(homeTarget) * 5
		
		move_and_slide()

func _on_engineer_call(target):
	homeTarget = target
	sentOut = true
