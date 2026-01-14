extends Node2D

signal engineerCall(homePosition)

var sentEngineer = false
var targetHomePosition
var homes : Array[Node]
var engineer = load("res://engineer.tscn")


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
		

func _on_answered(homePosition) -> void:
	print("WOW ANSWERED BY HQ")
	targetHomePosition = homePosition
	sentEngineer = true
	
	
	
	
