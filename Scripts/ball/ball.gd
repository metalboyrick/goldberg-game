extends KinematicBody2D

export var speed: = Vector2(300.0,1000.0)
export var gravity: = 1000.0

var velocity: = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity * delta
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
