extends KinematicBody2D

#speed of the ball
var speed = 600
#ball velocity
var velocity = Vector2.ZERO

func _ready():
	randomize()
	#random velocity using an array, indexing and random function
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
	
func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		$collisionBeep.play()
		

func stop_ball():
	speed = 0
	

func restart_ball():
	speed = 600
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
