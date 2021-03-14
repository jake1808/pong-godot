extends Node

var PlayerSore = 0
var OpponentScore = 0
var currentchildcount = 0
var prevchildcount = 0


func _on_LeftWall_body_entered(body):
		score_keeper(1,body)
		
		
func _on_RightWall_body_entered(body):
		score_keeper(0,body)
	

func _process(delta):
	$TimerLabel.text = str(int($CountdownTimer.time_left)+1)
	$PlayerScore.text = str(PlayerSore)
	$OpponentScore.text = str(OpponentScore)
	currentchildcount  = get_node("SpawnManager/BallDuplicate").get_child_count()

	# if(PlayerSore == 10 || OpponentScore == 10):
	# 	get_tree().paused = true
	# 	if Input.is_action_pressed("ui_reset"):
	# 		get_tree().reload_current_scene()
	


func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$TimerLabel.visible = false

func score_keeper(victor,body):
		
	if(victor == 1):
		if(body.name == 'Ball'):
			$Ball.position = Vector2(640, 360)
			OpponentScore += 1
			get_tree().call_group('BallGroup','stop_ball')
			$CountdownTimer.start()
			$TimerLabel.visible = true
			$ScoreSound.play()
		else:
			OpponentScore += 1
			$ScoreSound.play()
			body.queue_free()
	elif(victor == 0):
		if(body.name == 'Ball'):
			$Ball.position = Vector2(640, 360)
			PlayerSore += 1
			get_tree().call_group('BallGroup','stop_ball')
			$CountdownTimer.start()
			$TimerLabel.visible = true
			$ScoreSound.play()
		else:
			PlayerSore += 1
			$ScoreSound.play()
			body.queue_free()

		
	$Player.position.x = 35
	$Opponent.position.x = 1280 - 35
