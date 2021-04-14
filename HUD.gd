extends CanvasLayer


signal start_game


func _ready():
	$StartButton.hide()


#func _process(delta):
#	pass


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")

	$Message.text = "New game"
	$Message.show()

	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	

func update_score(score):
	$ScoreLabel.text = str(score)


func update_health(score):
	$HealthLabel.text = 'health: '+str(score)


func _on_MessageTimer_timeout():
	$Message.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
