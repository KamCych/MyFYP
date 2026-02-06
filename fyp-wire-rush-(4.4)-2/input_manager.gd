extends Node

#this script will take input from the controller

var knobActions : Array = ["PHONE", "NET", "DISCONNECT"]
var currentAction : String # for example: "NET"
var plugs : Array = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4"]
var currentlyPlugged : Array # for example: ["A2", "B1"]


func _ready() -> void:
	var homes = get_tree().get_nodes_in_group("homes")
	
	for i in homes:
		for j in currentlyPlugged:
			if i.name == j:
				i.connected = true

func onButtonPress():
	pass
