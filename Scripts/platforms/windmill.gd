extends KinematicBody2D

export var rotation_scale = 0.01

func _process(delta):
	rotate(rotation_scale)
	return
