extends Control

var score = 0
var lives = 3
var cables = 2

func _process(delta: float) -> void:
	$LivesLabel.text = "Lives: " + str(lives)
	$ScoreLabel.text = "Score: " + str(score)
	$CableLabel.text = "Cables: " + str(cables) + "/2"
	
	if (lives <= 0):
		get_tree().change_scene_to_file("res://game_over.tscn")
