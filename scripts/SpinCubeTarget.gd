extends StaticBody3D

@export var target_rotation: Vector3 = Vector3()
## Emitted when target is clicked, providing the desired cube rotation
signal update_target(target_rotation: Vector3)

## The action name to check for clicks (matches Input Map)
@export var click_action: String = "click"

var is_highlighted = false

func _on_mouse_entered() -> void:
	is_highlighted = true
	_update_visuals()

func _on_mouse_exited() -> void:
	is_highlighted = false
	_update_visuals()
	
## Updates visual feedback based on interaction state
func _update_visuals() -> void:
	$Mesh.visible = is_highlighted


func _on_input_event(_camera: Node, event: InputEvent, _position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event.is_action_pressed(click_action):
		emit_signal("update_target", target_rotation)
