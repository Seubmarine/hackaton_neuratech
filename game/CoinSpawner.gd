extends Area

onready var current_shape : Vector3 = $CollisionShape.shape.extents

func	_ready():
	$Timer.connect("timeout", self, "_on_timer_timeout")

func	_on_timer_timeout():
	var current : Coin = preload("res://rock/coin.tscn").instance(PackedScene.GEN_EDIT_STATE_DISABLED)
	current.default_positon(current_shape)
	add_child(current)

func _on_CoinSpawner_area_exited(area):
	if (has_node("Timer")):
		$Timer.disconnect("timeout", self, "_on_timer_timeout")
		$Timer.queue_free()
	if (area is Coin):
		area.default_positon(current_shape)
		area.visible = true
