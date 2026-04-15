extends Control

func playHappyEmote():
	$AngrySprite.visible = false
	$HappySprite.visible = true
	
func playAngryEmote():
	$AngrySprite.visible = true
	$HappySprite.visible = false
