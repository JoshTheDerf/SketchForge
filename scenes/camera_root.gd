extends Node3D

var is_rotating := false
var is_panning := false
var pan_plane := Plane(Vector3.UP, 0)

signal rotation_updated(new_rotation: Vector3)

func _on_control_gui_input(event: InputEvent) -> void:	
	var mouse_click = event as InputEventMouseButton
	# Handle right-click drag for rotation
	if mouse_click and mouse_click.button_index == 2 and mouse_click.pressed:
		is_rotating = true
		
	if mouse_click and mouse_click.button_index == 2 and !mouse_click.pressed:
		is_rotating = false
		
	if !mouse_click and is_rotating:
		rotate_object_local(Vector3(-1, 0, 0), event.relative.y / 100)
		rotate(Vector3(0, -1, 0), event.relative.x / 100)
		update()
	
	# Handle scroll wheel for zoom
	if mouse_click and (mouse_click.button_index == MOUSE_BUTTON_WHEEL_UP or mouse_click.button_index == MOUSE_BUTTON_WHEEL_DOWN):
		var zoom_speed = 0.2
		var zoom_dir = -1 if mouse_click.button_index == MOUSE_BUTTON_WHEEL_UP else 1
		$Camera.size = clamp($Camera.size + zoom_dir * zoom_speed * $Camera.size, 1.0, 100.0)
		update()
		
func update():		
		$/root/Base.SpinCube.rotation.x = rotation.x
		$/root/Base.SpinCube.rotation.y = rotation.y
		emit_signal("rotation_updated", rotation)

func _on_spin_cube_update_target(target_rotation: Vector3) -> void:
	var camera = $Camera
	var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	
	# Calculate position based on direction and distance
	var direction = Vector3(0, 0, 1).rotated(Vector3.UP, target_rotation.y)
	
	# Align camera to face the center from the target direction
	var target_transform = Transform3D.IDENTITY.looking_at(-direction, Vector3.UP)
	
	tween.tween_property(self, "rotation", target_rotation, 0.5)
