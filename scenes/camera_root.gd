extends Node3D

var is_rotating = false

signal rotation_updated(new_rotation: Vector3)

func _on_control_gui_input(event: InputEvent) -> void:	
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 2 and mouse_click.pressed:
		is_rotating = true
		
	if mouse_click and mouse_click.button_index == 2 and !mouse_click.pressed:
		is_rotating = false
		
	if !mouse_click and is_rotating:
		rotate_object_local(Vector3(-1, 0, 0), event.relative.y / 100)
		rotate(Vector3(0, -1, 0), event.relative.x / 100)
		update()
		
func update():		
		$/root/Base.SpinCube.rotation.x = rotation.x
		$/root/Base.SpinCube.rotation.y = rotation.y
		emit_signal("rotation_updated", rotation)

func _on_spin_cube_update_target(target_rotation: Vector3) -> void:
	print(target_rotation)
