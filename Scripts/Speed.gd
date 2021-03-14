extends Area2D

var collect = false

func _physics_process(delta):
	$AnimatedSprite.play('Spin')
	
	

func _on_Speed_body_entered(body):
	# print(body.name)
	if body.name=="Ball"&&collect==false:
		collect = true
		body.speed = 800
		# print(body.speed)
		$AnimationPlayer.play("collect")
		$AnimatedSprite.stop()
		$collectionSound.play()
		$Timer.start()
		queue_free()


func _on_Timer_timeout():
	get_parent().get_node('Ball').speed = 600
