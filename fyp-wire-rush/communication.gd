extends Node

#var serial: GdSerial
#var togg : bool
#
#func _ready():
	#serial = GdSerial.new()
	#
	## List available ports
	#var ports: Dictionary = serial.list_ports()
	#for i in ports:
		#var info = ports[i]
		#print("- ", info["port_name"], " (", info["device_name"], ")")
	#
	#serial.set_port("COM4")
	#serial.set_baud_rate(115200)
	#
#
	#if serial.open():
		#serial.writeline("hey\n")
		#await get_tree().create_timer(0.1).timeout
		#if serial.bytes_available() > 0:
			#print("Response: ", serial.readline())
			#serial.close()
