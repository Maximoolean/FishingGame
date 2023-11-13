extends CharacterBody2D

@export var movement_speed: float = 200.0
@export var movement_target_position1: Vector2 = Vector2(60.0,180.0)
@export var movement_target_position2: Vector2 = Vector2(60.0,180.0)
@export var movement_target_position3: Vector2 = Vector2(60.0,180.0)
@export var movement_target_position4: Vector2 = Vector2(60.0,180.0)

var i = 0

@export var navigation_agent: NavigationAgent2D

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0

	# Make sure to not await during _ready.
	call_deferred("actor_setup")

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(movement_target_position1)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(delta):
	# Set new position when destination is met
	if navigation_agent.is_navigation_finished():
		if i == 0:
			set_movement_target(movement_target_position2)
			i += 1
			return
		if i == 1:
			set_movement_target(movement_target_position3)
			i += 1
			return
		if i == 2:
			set_movement_target(movement_target_position4)
			i += 1
			return
		if i == 3:
			set_movement_target(movement_target_position1)
			i = 0
			return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * movement_speed

	velocity = new_velocity
	move_and_slide()
