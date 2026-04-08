extends CharacterBody2D

var sentOut = false
var homeTargetPosition
var homeTarget
var newHQ
var canMove = true


func _physics_process(delta: float) -> void:
	
	if sentOut:
		#get_node("HQ").engineerCall.connect(_on_engineer_call)
		
		velocity = global_position.direction_to(homeTargetPosition) * 40
		#print(velocity)
		
		if canMove:
			move_and_slide()

func _on_engineer_call(target):
	print("Calling engineer")
	homeTargetPosition = target.position
	homeTarget = target
	#target.connected = false
	sentOut = true

func engineerDisconnected():
	homeTarget.playerFailed()
	$Timer.start()
	canMove = false

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.get_parent().name == homeTarget.name:
		homeTarget.engineerArrived()
		queue_free()
		


func _on_timer_timeout() -> void:
	queue_free()
