extends Camera2D

func _process(_delta: float)-> void:
	var mouse_pos = get_global_mouse_position()
	var player_pos = get_node("..").global_position
	var player_to_mouse = mouse_pos - player_pos
	position = player_to_mouse / 8.

func _input(ev: InputEvent):
	if ev is InputEventMouseButton:
		if ev.pressed and ev.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom /= 1.1
		if ev.pressed and ev.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= 1.1
