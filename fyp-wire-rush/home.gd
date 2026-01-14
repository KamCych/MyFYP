extends Node2D

signal answered(homePosition)

var isCalling = false
var needHelp = false
var connected = false

func _process(delta: float) -> void:
	
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
	


func _on_button_pressed() -> void:
	answered.emit(global_position)
	isCalling = false
