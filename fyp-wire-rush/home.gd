extends Node2D

signal answered(homePosition)
signal selected(selectedProblem)

var isCalling = false
var needHelp = false
var connected = false

var problems = ["phone", "net"]

var problem : String # phone or net


func _process(delta: float) -> void:
	$PatienceMeter.value = $PatienceTimer.time_left * 10
	if isCalling:
		#Calling()
		$AnimationPlayer.play("ring")
		$Button.visible = true
	else:
		$AnimationPlayer.stop()
		$Button.visible = false


func Calling() -> void:
	$AnimationPlayer.play("ring")
	$Button.visible = true
	
	
func onCall():
	isCalling = true
	$PatienceTimer.start()

func _on_button_pressed() -> void:
	answered.emit(global_position)
	isCalling = false
	$PatienceTimer.stop()
	problem = problems[randi_range(0,1)]
	$ProblemText.text = problem
	selected.emit(problem) #why does this make answered signal problem?


func _on_patience_timer_timeout() -> void:
	isCalling = false
	#penalty for ignoring customer
	
func connectTo():
	problem = problems[randi_range(0,1)]
	$ProblemText.text = problem

func sendHelp(knobValue):
	if knobValue < -0.5 and problem == "phone":
		#COMPLETED
		pass
	if knobValue > -0.5 and knobValue < 0.5 and problem == "net":
		#COMPLETED
		pass
