extends Node3D

@onready var CameraAnchor = $CameraAnchor
@export var camera_move_duration: float = 0.5
@export var camera_distance: float = 2.0

signal update_target(target_rotation: Vector3)

func _on_front_update_target(target_rotation: Vector3) -> void:
	var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	var target_position = Vector3.BACK.rotated(Vector3.UP, target_rotation.y) * camera_distance
	tween.tween_property(CameraAnchor, "position", target_position, camera_move_duration)
	tween.parallel().tween_property(CameraAnchor, "rotation", target_rotation, camera_move_duration)
	emit_signal("update_target", target_rotation)
