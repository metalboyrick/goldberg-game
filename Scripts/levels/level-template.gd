extends Node2D

# level parameters
export var target_time = 10.00

var is_running = false												# level is running
var current_time = 0.0

onready var target_timer_label = get_node("timer-text")
onready var ball = get_node("ball")
onready var reset_point = get_node("reset-point")

# Called when the node enters the scene tree for the first time.
func _ready():
	ball.mode = RigidBody2D.MODE_STATIC
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_running:
		current_time += delta
		target_timer_label.text = str(current_time)

func _on_playbutton_pressed():
	is_running = true
	ball.mode = RigidBody2D.MODE_RIGID

func reset_gameplay():
	is_running = false
	target_timer_label.text = str(0)
	
	current_time = 0
	
	# respawn the ball
	ball.global_position = reset_point.global_position
	ball.mode = RigidBody2D.MODE_STATIC

func _on_resetbutton_pressed():
	reset_gameplay()
	pass # Replace with function body.


func _on_boundsleft_body_entered(body):
	if body.name == "ball":
		reset_gameplay()


func _on_boundsright_body_entered(body):
	if body.name == "ball":
		reset_gameplay()

func _on_boundstop_body_entered(body):
	if body.name == "ball":
		reset_gameplay()


func _on_boundsbottom_body_entered(body):
	if body.name == "ball":
		reset_gameplay()
