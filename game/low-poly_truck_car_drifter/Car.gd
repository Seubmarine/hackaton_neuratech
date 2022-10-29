extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var SPEED = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func	_physics_process(_delta : float):
	var strafe : float = Input.get_action_strength("car_right") - Input.get_action_strength("car_left")
	var velocity : Vector3 = Vector3.ZERO
	velocity.z = strafe * SPEED
	velocity = move_and_slide(velocity, Vector3.UP, false, 4, 0.785398, true)

func	touch_coin(_coin : Coin):
	print("touched a coin")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
