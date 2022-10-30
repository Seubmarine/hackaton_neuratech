extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#export var SPEED = 5.0
export(NodePath) onready var road = get_node(road) as Node
onready var road_node := road as CSGBox

onready var range_position : int = 3
const RANGE_MAX = 5
const RANGE_MIN = 1

func	_physics_process(_delta : float):
	
#	var strafe : float = Input.get_action_strength("car_right") - Input.get_action_strength("car_left")
#	var strafe : float = $PythonSinwave.left_right
	var velocity : Vector3 = Vector3.ZERO
	if (Input.is_action_just_pressed("car_right")):
		range_position += 1
	elif (Input.is_action_just_pressed("car_left")):
		range_position -= 1
	range_position = clamp(range_position, RANGE_MIN, RANGE_MAX)
	transform.origin.z = (road_node.width / RANGE_MAX) * range_position - (road_node.width / RANGE_MAX) * 3
#	velocity.z = range_position
#	velocity = move_and_slide(velocity, Vector3.UP, false, 4, 0.785398, true)

func	touch_coin(_coin : Coin):
	print("touched a coin")
	$LabelScore.score += 1
