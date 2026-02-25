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

	var joypads = Input.get_connected_joypads()
	print("Connected joypads: ", joypads)

func _input(event):
	if event is InputEventJoypadButton:
		if event.pressed:
			print("Button pressed: ", event.button_index)

func _process(delta: float) -> void:
	if sentEngineer:
		var newEngineer = engineer.instantiate()
		add_child(newEngineer)
		#newEngineer.engineerCall.connect(_on_engineer_call)
		newEngineer._on_engineer_call(targetHomePosition)
		#engineerCall.emit(targetHomePosition)
		sentEngineer = false
	
	
	if Input.is_action_pressed("a1"):
		print("PRESSED BUTTON ON CONTROLLER")

func _on_answered(homePosition) -> void:
	print("WOW ANSWERED BY HQ")
	targetHomePosition = homePosition
	sentEngineer = true
	
	
	
	
