extends Label3D

onready var score : int = 0 setget set_score

func _ready():
	text = str(score)

func set_score(new_score : int) -> void:
	score = new_score
	text = str(score)
