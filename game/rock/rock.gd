extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	connect("area_entered", self, "on_area_activate")
#
#func _on_Area_entered():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Rock_body_entered(body : Node):
	if (body.has_method())
