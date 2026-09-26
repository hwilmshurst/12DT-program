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

#variable that stores the starting gravity direction
var gravity_direction = Vector2.DOWN
var current_direction = 0


func _physics_process(delta):
	#function that applies gravity to the ball
	apply_central_force(gravity_direction * gravity_strength)


func _process(delta):
#function that reloads the current level when the r key is pressed
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
#function that runs through the directions dictionary to change direction
	if Input.is_action_just_pressed("ui_accept"):
		current_direction = (current_direction + 1) % 4
		gravity_direction = directions[current_direction]
