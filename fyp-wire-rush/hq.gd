extends Node2D

signal engineerCall(homePosition)

var sentEngineer = false
var targetHomePosition
var homes : Array[Node]
var engineer = load("res://engineer.tscn")
var waitingForInput = false

func _ready() -> void:
	homes = get_tree().get_nodes_in_group("homes")
	
	for i in len(homes):
		homes[i].answered.connect(_on_answered)



func _process(delta: float) -> void:
	if sentEngineer:
		var newEngineer = engineer.instantiate()
		add_child(newEngineer)
		#newEngineer.engineerCall.connect(_on_engineer_call)
		newEngineer._on_engineer_call(targetHomePosition)
		#engineerCall.emit(targetHomePosition)
		sentEngineer = false
	
	if waitingForInput:
		if Input.is_action_pressed("confirm"):
			pass
			#send help
	
	if Input.is_action_pressed("a1"):
		print("PRESSED BUTTON ON CONTROLLER")
		if homes[0].isCalling:
			homes[0].connected = true
			waitingForInput = true
			#notify home that theyre connected.
			#wait for input
func _on_answered(homePosition) -> void:
	print("WOW ANSWERED BY HQ")
	targetHomePosition = homePosition
	sentEngineer = true
	
	
	
	
