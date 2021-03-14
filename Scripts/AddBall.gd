extends Node2D

var collect = false
var ballscene = null

func _ready():
	$Area2D/AnimatedSprite.play("Spin")

func _on_Area2D_body_entered(body):
	#print(body.name)
	if body.name=="Ball"&&collect==false:
		collect = true
		$Collection.play()
		$AnimationPlayer.play("Fade")
		$Area2D/AnimatedSprite.stop()
		var ball =  load("res://Scenes/BallDuplicate.tscn")
		ballscene = ball.instance()
		find_parent("SpawnManager").get_node("BallDuplicate").add_child(ballscene)
		queue_free()
		
		
		

