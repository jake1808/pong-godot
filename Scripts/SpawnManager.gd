extends Node2D




enum{SPEED, ADDBALL}

func ready():
	print('spawn called')
	_spawnStart()
	

func _spawnStart():
	print('timer started')
	$SpawnTimer.start()

func  _on_SpawnTimer_timeout():
	randomize()

	var speedPowerup = load("res://Scenes/Speed.tscn")
	var addBall = load("res://Scenes/AddBall.tscn")
	var scene
	var pos = Vector2()

	# print('selecting powerup')
	
	var num = randi()%2+SPEED
	pos.x = rand_range(0+300,get_viewport_rect().size.x-300)
	pos.y = rand_range(0+200,get_viewport_rect().size.y-200)
	# print(num)

	if(num == SPEED):
		# print('speed')
		# print("x=%d%%" %pos.x)
		# print("y=%d%%" %pos.y)
		scene = speedPowerup.instance()
		scene.set_position(pos)
		get_node("PowerUps").add_child(scene)
	elif(num == ADDBALL):
		# print('AddBall')
		# print("x=%d%%" %pos.x)
		# print("y=%d%%" %pos.y)
		scene = addBall.instance()
		scene.set_position(pos)
		get_node("PowerUps").add_child(scene)
		
