extends KinematicBody2D

class_name Platform

export var rotation_scale = 0.05

# Declare member variables here. Examples:
var can_grab = false
var grabbed_offset = Vector2()
var is_playing = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		
		if !is_playing:
			# select indicator
			modulate = Color(0, 1, 0, 1)

			# handle rotation
			if Input.is_action_pressed("ui_right"):
				if rotation < deg2rad(90):
					rotate(rotation_scale)
			elif Input.is_action_pressed("ui_left"):    
				if rotation > deg2rad(-90):
					rotate(-1 * rotation_scale) 

			position = get_global_mouse_position() + grabbed_offset
			move_and_slide(Vector2(get_global_mouse_position() + grabbed_offset))
		
	else:
		# normal colors in regular setting
		modulate = Color(1, 1, 1, 1)
