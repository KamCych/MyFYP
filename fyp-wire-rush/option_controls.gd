extends Control

signal picked_choice(option)

var current_choice = "phone"

var bigText = 40
var regText = 30

func _process(delta: float) -> void:
	var knobAxis = Input.get_axis("left_knob", "right_knob")
	
	if knobAxis < -0.5:
		#print("sent phone eng") #originally Reset()
		$PhoneText.add_theme_font_size_override("font_size", bigText)
		$PhoneText.add_theme_color_override("font_color", Color.hex(0x00ffa5ff))
		$RadioText.add_theme_font_size_override("font_size", regText)
		$RadioText.add_theme_color_override("font_color", Color.hex(0xffffffff))
		$NetText.add_theme_font_size_override("font_size", regText)
		$NetText.add_theme_color_override("font_color", Color.hex(0xffffffff))
	elif knobAxis > 0.5:
		#print("sent net eng")
		$PhoneText.add_theme_font_size_override("font_size", regText)
		$PhoneText.add_theme_color_override("font_color", Color.hex(0xffffffff))
		$RadioText.add_theme_font_size_override("font_size", regText)
		$RadioText.add_theme_color_override("font_color", Color.hex(0xffffffff))
		$NetText.add_theme_font_size_override("font_size", bigText)
		$NetText.add_theme_color_override("font_color", Color.hex(0x00ffa5ff))
	else:
		#print("sent radio eng")
		$PhoneText.add_theme_font_size_override("font_size", regText)
		$PhoneText.add_theme_color_override("font_color", Color.hex(0xffffffff))
		$RadioText.add_theme_font_size_override("font_size", bigText)
		$RadioText.add_theme_color_override("font_color", Color.hex(0x00ffa5ff))
		$NetText.add_theme_font_size_override("font_size", regText)
		$NetText.add_theme_color_override("font_color", Color.hex(0xffffffff))
	#print("knobAxis: " + str(knobAxis))
	#if knobAxis < -0.5:
		#print("PHONE")
	#elif knobAxis > 0.5:
		#print("NET")

func _on_phone_butt_pressed() -> void:
	current_choice = "phone"



func _on_net_butt_pressed() -> void:
	current_choice = "net"



func _on_disconnect_butt_pressed() -> void:
	current_choice = "disconnect"


func _on_button_pressed() -> void:
	picked_choice.emit(current_choice)
