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

func _ready() -> void:
	$PatienceTimer.wait_time = timer_max

func _process(delta: float) -> void:
	$PatienceMeter.value = $PatienceTimer.time_left * (100/timer_max)
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
	$ProblemText.text = ""

func Calling() -> void:
	$AnimationPlayer.play("ring")
	$Button.visible = true
	
	
func onCall():
	isCalling = true
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

func _on_patience_timer_timeout() -> void:
	isCalling = false
	print("failed to help customer")
	Reset()
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

func engineerArrived():
	#plus one to score
	Reset()
	print("YOU HEL:PED A CUUSTOMER")

func playerFailed():
	Reset()
	print("YOU LOST A CUSTOMER")
