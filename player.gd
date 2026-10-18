extends Living

func _init():
	speed = 250.

func ai(_delta: float)-> Vector2:
	return Vector2(
		Input.get_action_strength("Right") -
			Input.get_action_strength("Left"),
		Input.get_action_strength("Down") -
			Input.get_action_strength("Up")
	)
