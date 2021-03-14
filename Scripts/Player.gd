extends KinematicBody2D

#Player speed
var speed = 400

#up and down movement
func _physics_process(delta):
	#velocity vector(x,y)
	var velocity = Vector2.ZERO
	#keyboard input
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1 * speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1 * speed
	
	move_and_slide(velocity)
	
