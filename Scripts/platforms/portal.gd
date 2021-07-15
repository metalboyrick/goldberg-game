extends KinematicBody2D

func _ready():
	var ball = get_tree().get_root().find_node("ball", true, false)
	
func teleport(other_portal: KinematicBody2D, ball: KinematicBody2D):
	return

func _on_body_entered(body):
	if body.name == "ball":
		teleport
	return 
