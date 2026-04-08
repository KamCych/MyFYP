extends Control

var phoneString = "I'm having problems with my phone!"
var netString = "My wifi stopped working!"
var radioString = "My radio is broken!"

func _ready() -> void:
	$RichTextLabel.visible_characters = 0
	print(phoneString.length())

func showDialogue(problem):
	if problem == "phone":
		$RichTextLabel.text = phoneString
	elif problem == "net":
		$RichTextLabel.text = netString
	elif problem == "radio":
		$RichTextLabel.text = radioString

func startDialogue():
	$SpeechTimer.start()
	$CharacterIcon.visible = true


func _on_speech_timer_timeout() -> void:
	if $RichTextLabel.visible_characters <= phoneString.length():
		$RichTextLabel.visible_characters += 1

func _on_spawn_timer_timeout() -> void:
	startDialogue()
