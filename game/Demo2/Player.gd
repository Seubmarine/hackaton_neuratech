extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export onready var rotation_sensitivity := 1
export onready var speed_sensitivity := 1

onready var current_rotation = 0
onready var is_walking = false

func _physics_process(delta):
	var velocity := Vector3.ZERO
	if (Input.is_action_just_pressed("human_rotate_left")):
		current_rotation += 1
	elif (Input.is_action_just_pressed("human_rotate_right")):
		current_rotation -= 1
	current_rotation = clamp(current_rotation, -1, 1)
	rotate_y(current_rotation * rotation_sensitivity * delta)
	if (Input.is_action_just_pressed("human_forward")):
		is_walking = not is_walking
	velocity += -transform.basis.z * (int(is_walking) * speed_sensitivity)
	move_and_slide(velocity, Vector3.UP, false, 4, 0.785389, true)


func _on_HSliderRotSensi_value_changed(value):
	rotation_sensitivity = value


func _on_HSliderWalkSpeed_value_changed(value):
	speed_sensitivity = value
