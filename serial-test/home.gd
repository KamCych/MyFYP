extends Node2D

signal answered(homePosition, homeName)
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
		$AnimationPlayer.play("calling")
		$Button.visible = true
	else:
		$AnimationPlayer.stop()
		$Button.visible = false


func Calling() -> void:
	$AnimationPlayer.play("calling")
	$Button.visible = true
	
	
func onCall():
	isCalling = true
	$PatienceTimer.start()
	answered.emit(global_position, name)

func _on_button_pressed() -> void:
	#answered.emit(global_position, name)
	isCalling = false
	$PatienceTimer.stop()
	problem = problems[randi_range(0,1)]
	$ProblemText.text = problem
	selected.emit(problem) #why does this make answered signal problem?


func _on_patience_timer_timeout() -> void:
	isCalling = false
	#penalty for ignoring customer
