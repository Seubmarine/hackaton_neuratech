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
	change_color(Color(255, 38, 0))

onready var DEFAULT_COLOR : Color = coin_material.get("albedo_color")

func _on_Coin_body_exited(_body : Node):
	change_color(DEFAULT_COLOR)
