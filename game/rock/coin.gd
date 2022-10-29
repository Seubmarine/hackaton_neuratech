extends Area
class_name Coin

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



onready var coin_material : Material = $MeshInstance.get_active_material(0)

func change_color(color : Color) -> void:
	coin_material.set("albedo_color", color)

func _on_Coin_body_entered(body : Node):
	if (body.has_method("touch_coin")):
		body.touch_coin(self)
	hide()	
#	change_color(Color(255, 38, 0))

onready var DEFAULT_COLOR : Color = coin_material.get("albedo_color")

func _physics_process(delta):
	transform.origin.x -= 1

func default_positon(shape : Vector3):
	var left_right_position = rand_range(-shape.z, shape.z)
	transform.origin = Vector3(shape.x, 0, left_right_position) 
