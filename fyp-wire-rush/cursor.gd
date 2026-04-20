extends CharacterBody2D

#var velocity = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
var currentHome

func _ready() -> void:
	
	if (Input.get_joy_name(0) == "Xbox One For Windows"):
		print("xbox controller connected")
	else:
		print(Input.get_joy_name(0))

var speed = 400

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	var collision = move_and_collide(velocity * delta)
	if collision:
		print("I collided with ", collision.get_collider().name)


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	currentHome = area.get_parent().name
