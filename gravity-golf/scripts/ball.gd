extends RigidBody2D


# dictionary that stores the different directions the ball can travel
var directions = [
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.UP,
	Vector2.RIGHT

]

# variable that stores the starting gravity strength
@export var gravity_strength: float = 200.0
# Stores the gravity multiplier
@export var gravity_multiplier: float = 1.0



#variable that stores the starting gravity direction
var gravity_direction = Vector2.DOWN
var current_direction = 0
var gravity_change_speed: float = 1


func _physics_process(delta):
	apply_central_force(gravity_direction * gravity_strength * gravity_multiplier)


func _process(delta):
#function that reloads the current level when the r key is pressed
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
#function that runs through the directions dictionary to change direction
	if Input.is_action_just_pressed("ui_accept"):
		current_direction = (current_direction + 1) % 4
		gravity_direction = directions[current_direction]
			# Increase gravity with Up Arrow
	# Gradually increase gravity while Up Arrow is held
	if Input.is_key_pressed(KEY_UP):
		gravity_multiplier += gravity_change_speed * delta
	# Gradually decrease gravity while Down Arrow is held
	if Input.is_key_pressed(KEY_DOWN):
		gravity_multiplier -= gravity_change_speed * delta
	# Keep multiplier between 1.00x and 3.00x
	gravity_multiplier = clamp(gravity_multiplier, 0.25, 3.0)
