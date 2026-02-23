extends Node2D

signal engineerCall(homePosition)

var sentEngineer = false
var targetHomePosition
var homes : Array[Node]
var engineer = load("res://engineer.tscn")
var serial

var homeIsCalling = false
var connectedCable : bool = false
var currentProblem : String
var buttonPressed : bool = false
var currentHomeCalling 


func _ready() -> void:
	serial = $"../Serial";
	homes = get_tree().get_nodes_in_group("homes")
	
	for i in len(homes):
		homes[i].answered.connect(_on_answered)

func _process(delta: float) -> void:
	if homeIsCalling:
		
		if serial.jack1 == "active":
			connectedCable = true
		#	if buttonpressed and 
	
	if connectedCable:
		if serial.action == currentProblem:
			SendEngineer()
		
		
		
func SendEngineer():
	var newEngineer = engineer.instantiate()
	add_child(newEngineer)
	#newEngineer.engineerCall.connect(_on_engineer_call)
	newEngineer._on_engineer_call(targetHomePosition)
	#engineerCall.emit(targetHomePosition)
	sentEngineer = false

func _on_answered(homePosition, homeName, homeProblem) -> void:
	print("WOW ANSWERED BY HQ")
	targetHomePosition = homePosition
	currentHomeCalling = homeName
	currentProblem = homeProblem
	homeIsCalling = true
	#sentEngineer = true
	# DONT SEND HIM YET
	# first wait to select a button action
	
	
