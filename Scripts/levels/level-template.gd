extends Node2D

# TODO : disable play button when dragging
# TODO : set non-adjustable areas

# level parameters
export var target_time = 10.00

var is_running = false												# level is running
var current_time = 0.0

onready var counter_timer = get_node("timer-text")
onready var target_time_label = get_node("target-time")
onready var ball = get_node("ball")
onready var reset_point = get_node("reset-point")
onready var play_button = get_node("play-button")
onready var reset_button = get_node("reset-button")
onready var platforms = get_tree().get_nodes_in_group("Platforms")

# Called when the node enters the scene tree for the first time.
func _ready():
	ball.is_running = false
	target_time_label.text = str(target_time)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_running:
		current_time += delta
		counter_timer.text = str(current_time)

func _on_playbutton_pressed():
	is_running = true
	ball.is_running = true
	toggle_buttons(true)
	
	# freeze all blocks
	for platform in platforms:
		platform.is_playing = true

func reset_gameplay():
	
	# unfreeze all blocks
	for platform in platforms:
		platform.is_playing = false
	
	toggle_buttons(false)
	
	ball.is_running = false
	ball.velocity = Vector2.ZERO
	is_running = false
	counter_timer.text = str(0)
	
	current_time = 0
	
	# respawn the ball
	ball.global_position = reset_point.global_position
	
func win_game():
	if current_time < target_time:
		reset_gameplay()
	print("win")

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


func _on_goal_body_entered(body):
	if body.name == "ball":
		win_game()

func toggle_buttons(play_value:bool):
	play_button.disabled = play_value
	reset_button.disabled = !play_value
	
