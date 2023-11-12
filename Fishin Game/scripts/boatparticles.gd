extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	# Turn off the particles when not in motion
	if input_direction.x < 0 or input_direction.y < 0 or input_direction.x > 0 or input_direction.y > 0:
		emitting = true
	else :
		emitting = false
		
	# Change direction of particles when moving left
	if input_direction.x < 0:
		gravity.x = 20
	elif input_direction.x > 0:
		gravity.x = -20
