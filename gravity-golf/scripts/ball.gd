extends RigidBody2D

var directions = [
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.UP,
	Vector2.RIGHT

]


@export var gravity_strength: float = 200.0

var gravity_direction = Vector2.DOWN
var current_direction = 0

func _physics_process(delta):
	apply_central_force(gravity_direction * gravity_strength)


func _ready() -> void:
	pass 



func _process(delta):

	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()

	if Input.is_action_just_pressed("ui_accept"):
		current_direction = (current_direction + 1) % 4
		gravity_direction = directions[current_direction]
