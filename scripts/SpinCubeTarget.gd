extends StaticBody3D

@export var target_rotation: Vector3 = Vector3()
signal update_target(target_rotation: Vector3)

var is_highlighted = false

func _on_mouse_entered() -> void:
	print("ENTERED")
	is_highlighted = true
	update()

func _on_mouse_exited() -> void:
	is_highlighted = false
	update()
	
func update():
	if is_highlighted:
		$Mesh.visible = true
	else:
		$Mesh.visible = false


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
		emit_signal("update_target", target_rotation)
