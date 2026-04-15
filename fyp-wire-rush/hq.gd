extends Node2D

signal engineerCall(homePosition)

var sentEngineer = false
var targetHomePosition
var homes : Array[Node]
var engineer = load("res://engineer.tscn")
var waitingForInput = false
var lastConnectedHome
var newEngineer
var engineers : Array[Node]

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
		if Input.get_joy_name(0) != "XInput Controller":
			if Input.is_action_pressed("confirm"):
				# `walk` will be a floating-point number between `-1.0` and `1.0`.
				var knobAxis = Input.get_axis("left_knob", "right_knob")
				if lastConnectedHome.sendHelp(knobAxis):
					waitingForInput = false
					newEngineer = engineer.instantiate()
					add_child(newEngineer)
					
					
					
					
					
					#newEngineer.engineerCall.connect(_on_engineer_call)
					newEngineer._on_engineer_call(lastConnectedHome)
					engineers.append(newEngineer)
					#engineerCall.emit(targetHomePosition)
		else:
			if Input.is_action_pressed("xbox_confirm"):
				# `walk` will be a floating-point number between `-1.0` and `1.0`.
				var knobAxis = Input.get_axis("left_knob", "right_knob")
				if lastConnectedHome.sendHelp(knobAxis):
					waitingForInput = false
					newEngineer = engineer.instantiate()
					add_child(newEngineer)
					
					
					if knobAxis < -0.5:
						print("sent phone eng") #originally Reset()
						newEngineer.type = "phone"
					elif knobAxis > 0.5:
						print("sent net eng")
						newEngineer.type = "net"
					else:
						print("sent radio eng")
						newEngineer.type = "radio"
						
					
					#newEngineer.engineerCall.connect(_on_engineer_call)
					newEngineer._on_engineer_call(lastConnectedHome)
					engineers.append(newEngineer)
					#engineerCall.emit(targetHomePosition)
		
				
			#send help
	print(Input.get_joy_name(0))
	if Input.get_joy_name(0) != "XInput Controller":
		
	
		if Input.is_action_just_pressed("a1"):
			print("Put in cable")
			homes[0].connected = true
			#print("PRESSED BUTTON a1 ON CONTROLLER")
			if homes[0].isCalling:
				
				homes[0].pickedUp()
				waitingForInput = true
				lastConnectedHome = homes[0]
				#notify home that theyre connected.
				#wait for input
		elif Input.is_action_just_released("a1"):
			# how to track the correct engineer? 
			# each home should track which engineer is on its way
			# or the other way around?
			homes[0].connected = false
			for i in range(engineers.size()):
				if is_instance_valid(engineers[i]):
					if engineers[i].homeTarget.name == "a1":
						engineers[i].engineerDisconnected()
						engineers.remove_at(i)
					
			#if newEngineer.sentOut:
				#newEngineer.queue_free()
		if Input.is_action_just_pressed("a2"):
			#print("PRESSED BUTTON a2 ON CONTROLLER")
			homes[1].connected = true
			if homes[1].isCalling:
				
				homes[1].pickedUp()
				waitingForInput = true
				lastConnectedHome = homes[1]
				#notify home that theyre connected.
				#wait for input
		elif Input.is_action_just_released("a2"):
			homes[1].connected = false
			for i in range(engineers.size()):
				if is_instance_valid(engineers[i]):
					if engineers[i].homeTarget.name == "a2":
						engineers[i].engineerDisconnected()
						engineers.remove_at(i)
		if Input.is_action_just_pressed("a3"):
			#print("PRESSED BUTTON a3 ON CONTROLLER")
			homes[2].connected = true
			if homes[2].isCalling:
				
				homes[2].pickedUp()
				waitingForInput = true
				lastConnectedHome = homes[2]
				#notify home that theyre connected.
				#wait for input
		elif Input.is_action_just_released("a3"):
			homes[2].connected = false
			for i in range(engineers.size()):
				if is_instance_valid(engineers[i]):
					if engineers[i].homeTarget.name == "a3":
						engineers[i].engineerDisconnected()
						engineers.remove_at(i)
		if Input.is_action_just_pressed("a4"):
			#print("PRESSED BUTTON a4 ON CONTROLLER")
			homes[3].connected = true
			if homes[3].isCalling:
				
				homes[3].pickedUp()
				waitingForInput = true
				lastConnectedHome = homes[3]
				#notify home that theyre connected.
				#wait for input
		elif Input.is_action_just_released("a4"):
			homes[3].connected = false
			for i in range(engineers.size()):
				if is_instance_valid(engineers[i]):
					if engineers[i].homeTarget.name == "a4":
						engineers[i].engineerDisconnected()
						engineers.remove_at(i)
		if Input.is_action_just_pressed("a5"):
			homes[4].connected = true
			#print("PRESSED BUTTON a5 ON CONTROLLER")
			if homes[4].isCalling:
				
				homes[4].pickedUp()
				waitingForInput = true
				lastConnectedHome = homes[4]
				#notify home that theyre connected.
				#wait for input
		elif Input.is_action_just_released("a5"):
			homes[4].connected = false
			for i in range(engineers.size()):
				if is_instance_valid(engineers[i]):
					if engineers[i].homeTarget.name == "a5":
						engineers[i].engineerDisconnected()
						engineers.remove_at(i)
		if Input.is_action_just_pressed("a6"):
			#print("PRESSED BUTTON a6 ON CONTROLLER")
			homes[5].connected = true
			if homes[5].isCalling:
				
				homes[5].pickedUp()
				waitingForInput = true
				lastConnectedHome = homes[5]
				#notify home that theyre connected.
				#wait for input
		elif Input.is_action_just_released("a6"):
			homes[5].connected = false
			for i in range(engineers.size()):
				if is_instance_valid(engineers[i]):
					if engineers[i].homeTarget.name == "a6":
						#error maybve because the engineer gets destroyed before this happens
						engineers[i].engineerDisconnected()
						engineers.remove_at(i)
	
	else: #if the controller is an xbox controller
		if $"../Cursor".currentHome == "a1":
			if Input.is_action_just_pressed("connect"):
				if !homes[0].connected:
					print("Put in cable")
					homes[0].connected = true
					#print("PRESSED BUTTON a1 ON CONTROLLER")
					if homes[0].isCalling:
						
						homes[0].pickedUp()
						waitingForInput = true
						lastConnectedHome = homes[0]
						#notify home that theyre connected.
						#wait for input
				else:
					# how to track the correct engineer? 
					# each home should track which engineer is on its way
					# or the other way around?
					homes[0].connected = false
					for i in range(engineers.size()):
						if is_instance_valid(engineers[i]):
							if engineers[i].homeTarget.name == "a1":
								engineers[i].engineerDisconnected()
								engineers.remove_at(i)
		if $"../Cursor".currentHome == "a2":
			if Input.is_action_just_pressed("connect"):
				if !homes[1].connected:
					print("Put in cable")
					homes[1].connected = true
					#print("PRESSED BUTTON a1 ON CONTROLLER")
					if homes[1].isCalling:
						
						homes[1].pickedUp()
						waitingForInput = true
						lastConnectedHome = homes[1]
						#notify home that theyre connected.
						#wait for input
				else:
					# how to track the correct engineer? 
					# each home should track which engineer is on its way
					# or the other way around?
					homes[1].connected = false
					for i in range(engineers.size()):
						if is_instance_valid(engineers[i]):
							if engineers[i].homeTarget.name == "a2":
								engineers[i].engineerDisconnected()
								engineers.remove_at(i)
		if $"../Cursor".currentHome == "a3":
			if Input.is_action_just_pressed("connect"):
				if !homes[2].connected:
					print("Put in cable")
					homes[2].connected = true
					#print("PRESSED BUTTON a1 ON CONTROLLER")
					if homes[2].isCalling:
						
						homes[2].pickedUp()
						waitingForInput = true
						lastConnectedHome = homes[2]
						#notify home that theyre connected.
						#wait for input
				else:
					# how to track the correct engineer? 
					# each home should track which engineer is on its way
					# or the other way around?
					homes[2].connected = false
					for i in range(engineers.size()):
						if is_instance_valid(engineers[i]):
							if engineers[i].homeTarget.name == "a3":
								engineers[i].engineerDisconnected()
								engineers.remove_at(i)
		if $"../Cursor".currentHome == "a4":
			if Input.is_action_just_pressed("connect"):
				if !homes[3].connected:
					print("Put in cable")
					homes[3].connected = true
					#print("PRESSED BUTTON a1 ON CONTROLLER")
					if homes[3].isCalling:
						
						homes[3].pickedUp()
						waitingForInput = true
						lastConnectedHome = homes[3]
						#notify home that theyre connected.
						#wait for input
				else:
					# how to track the correct engineer? 
					# each home should track which engineer is on its way
					# or the other way around?
					homes[3].connected = false
					for i in range(engineers.size()):
						if is_instance_valid(engineers[i]):
							if engineers[i].homeTarget.name == "a4":
								engineers[i].engineerDisconnected()
								engineers.remove_at(i)
		if $"../Cursor".currentHome == "a5":
			if Input.is_action_just_pressed("connect"):
				if !homes[4].connected:
					print("Put in cable")
					homes[4].connected = true
					#print("PRESSED BUTTON a1 ON CONTROLLER")
					if homes[4].isCalling:
						
						homes[4].pickedUp()
						waitingForInput = true
						lastConnectedHome = homes[4]
						#notify home that theyre connected.
						#wait for input
				else:
					# how to track the correct engineer? 
					# each home should track which engineer is on its way
					# or the other way around?
					homes[4].connected = false
					for i in range(engineers.size()):
						if is_instance_valid(engineers[i]):
							if engineers[i].homeTarget.name == "a5":
								engineers[i].engineerDisconnected()
								engineers.remove_at(i)
		if $"../Cursor".currentHome == "a6":
			if Input.is_action_just_pressed("connect"):
				if !homes[5].connected:
					print("Put in cable")
					homes[5].connected = true
					#print("PRESSED BUTTON a1 ON CONTROLLER")
					if homes[5].isCalling:
						
						homes[5].pickedUp()
						waitingForInput = true
						lastConnectedHome = homes[5]
						#notify home that theyre connected.
						#wait for input
				else:
					# how to track the correct engineer? 
					# each home should track which engineer is on its way
					# or the other way around?
					homes[5].connected = false
					for i in range(engineers.size()):
						if is_instance_valid(engineers[i]):
							if engineers[i].homeTarget.name == "a6":
								engineers[i].engineerDisconnected()
								engineers.remove_at(i)
					
func _on_answered(homePosition) -> void:
	print("WOW ANSWERED BY HQ")
	targetHomePosition = homePosition
	sentEngineer = true
	
	
	
	
