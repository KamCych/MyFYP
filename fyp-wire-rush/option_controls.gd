extends Control

signal picked_choice(option)

var current_choice = "phone"


func _on_phone_butt_pressed() -> void:
	current_choice = "phone"



func _on_net_butt_pressed() -> void:
	current_choice = "net"



func _on_disconnect_butt_pressed() -> void:
	current_choice = "disconnect"


func _on_button_pressed() -> void:
	picked_choice.emit(current_choice)
