extends KinematicBody2D

class_name Platform

# Declare member variables here. Examples:
var can_grab = false
var grabbed_offset = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		print(get_slide_count())
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
		move_and_slide(Vector2(get_global_mouse_position() + grabbed_offset))
