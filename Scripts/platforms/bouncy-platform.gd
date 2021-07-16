extends Platform

onready var _animated_sprite = $AnimatedSprite
onready var playing = false

func _ready():
	_animated_sprite.stop()

func _process(delta):
	if playing == true:
		if _animated_sprite.frame != 0: 
			_animated_sprite.frame = 0
		_animated_sprite.play("bounce")
	
func _on_Area2D_body_entered(body):
	if body.name == "ball":
		playing = true

func _on_Area2D_body_exited(body):
	if body.name == "ball":
		playing = false

func _on_AnimatedSprite_animation_finished():
	_animated_sprite.stop()


