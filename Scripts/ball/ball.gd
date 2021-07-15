extends KinematicBody2D

export var bounce_speed = 800.0
export var accel_magnitude = 25.0
export var gravity: = 1000.0

onready var velocity: = Vector2.ZERO


func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
	print(get_floor_velocity())
	if get_slide_count() > 0:
		var collision = get_slide_collision(0)
		if "bouncy-platform" in collision.collider.name:
			if velocity.y > 0: velocity.y = 0
			velocity += collision.normal * bounce_speed
		elif "accel-platform" in collision.collider.name:
			velocity += calculate_accel_vector(collision)		
	return
	

func calculate_accel_vector(collision: KinematicCollision2D) -> Vector2:
	var out: = collision.normal.rotated(PI/2)
	var accel_scale = accel_magnitude
	if out.x != 0 and out.y != 1:
		accel_scale -= 10
	return out * accel_magnitude

