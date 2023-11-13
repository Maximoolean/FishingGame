extends CharacterBody2D

@export var move_speed : float = 50.0
var particles : CPUParticles2D
var can_fish : bool
var can_cast : bool = true
var reel_cast_sound = AudioStreamPlayer2D


func _ready():
	reel_cast_sound = $AudioStreamPlayer2D

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	#Update velocity
	velocity = input_direction * move_speed
	
	# Handle Movement
	move_and_slide()
	
	
# Check for entering areas
func _on_area_2d_area_entered(area):			
	# Check if entering fishing spot and allow for fishing
	if area.is_in_group("fishing_spot"):
		can_fish = true
		print(can_fish)
	
	
# Check for leaving fishing spot
func _on_area_2d_area_exited(area):
	if area.is_in_group("fishing_spot"):
		can_fish = false
		print(can_fish)
		
		
# Called every frame to lets the player fish if allowed
func _process(_delta):
	if can_fish == true:
		if Input.is_action_just_pressed("Fish") and can_cast == true:
			reel_cast_sound.play()
			Global.fish += 1
			print("got fish")
			can_cast = false
			await get_tree().create_timer(Global.fishing_speed).timeout
			can_cast = true
