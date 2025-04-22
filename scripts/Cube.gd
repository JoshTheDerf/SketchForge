extends CSGBox3D

func _on_static_body_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
		var shift_pressed = mouse_click.shift_pressed
		get_node("/root/Base/SelectionHandler").handle_selection(self, shift_pressed)
