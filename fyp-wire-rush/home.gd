extends Node2D

signal answered(homePosition)
signal selected(selectedProblem)

var isTalking = false
var isCalling = false
var needHelp = false

var connected = false

var problems = ["phone", "net", "radio"]

var problem : String # phone or net
var timer_max = 20

var dialogueBox = load("res://dialogue.tscn")
var newDialogue

var patienceValue

func _ready() -> void:
	$PatienceTimer.wait_time = timer_max

func _process(delta: float) -> void:
	$PatienceMeter.value = $PatienceTimer.time_left * (100/timer_max)
	patienceValue = $PatienceMeter.value
	if isCalling:
		#Calling()
		$AnimationPlayer.play("ring")
		$Button.visible = true
	else:
		$AnimationPlayer.stop()
		$Button.visible = false
		
	

func Reset():
	isTalking = false
	needHelp = false
	connected = false
	$PatienceTimer.stop()
	$PatienceMeter.visible = false
	$ProblemText.text = ""

func Calling() -> void:
	$AnimationPlayer.play("ring")
	$Button.visible = true
	
	
func onCall():
	isCalling = true
	$PatienceMeter.visible = true
	$PatienceTimer.start()
	$Ringing.play()
	

func _on_button_pressed() -> void:
	answered.emit(global_position)
	pickedUp()

func pickedUp():
	#isCalling = false
	#$PatienceTimer.stop()
	isCalling = false
	problem = problems[randi_range(0,2)]
	$ProblemText.text = problem
	isTalking = true
	
	selected.emit(problem) #why does this make answered signal problem?
	print("picked up phone")
	
	newDialogue = dialogueBox.instantiate()
	add_child(newDialogue)
	newDialogue.global_position = Vector2.ZERO
	newDialogue.showDialogue(problem)
	
	var randomSound = randi_range(0,1)
	if randomSound == 0:
		$Blabble.play()
	elif randomSound == 1:
		$Blabble2.play()

func _on_patience_timer_timeout() -> void:
	isCalling = false
	print("failed to help customer")
	playerFailed()
	#penalty for ignoring customer
	
func connectTo():
	problem = problems[randi_range(0,2)]
	$ProblemText.text = problem

func sendHelp(knobValue):
	print("sent help")
	newDialogue.queue_free()
	if knobValue < -0.5 and problem == "phone":
		print("sent phone eng") #originally Reset()
	elif knobValue > 0.5 and problem == "net":
		print("sent net eng")
	else:
		print("sent radio eng")
	
	return true

func engineerArrived(engineerType):
	#plus one to score
	if engineerType == problem:
		Reset()
		print("YOU HELPED A CUUSTOMER")
		$"../../Lives".score += 1
		$Emote.visible = true
		$Emote.playHappyEmote()
		$EmoteTimer.start()
	else:
		playerFailed()
	

func playerFailed():
	Reset()
	print("YOU LOST A CUSTOMER")
	$"../../Lives".lives -= 1
	$Emote.visible = true
	$Emote.playAngryEmote()
	$EmoteTimer.start()


func _on_emote_timer_timeout() -> void:
	$Emote.visible = false
