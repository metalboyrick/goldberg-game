extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var target_timer = get_node("bounce-timer")
onready var target_timer_label = get_node("timer-text")

# Called when the node enters the scene tree for the first time.
func _ready():
	target_timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target_timer_label.text = str(target_timer.time_left)




func _on_bouncetimer_timeout():
	print("bitch")
	pass # Replace with function body.
