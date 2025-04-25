extends Node3D

@onready var CameraAnchor = $CameraAnchor
@onready var MainCameraAnchor = $"/root/Base/Camera Root"
@export var camera_move_duration: float = 0.5
@export var camera_distance: float = 100

signal update_target(target_rotation: Vector3)

func _on_front_update_target(target_rotation: Vector3) -> void:
	var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(CameraAnchor, "rotation", target_rotation, camera_move_duration)
		
	emit_signal("update_target", target_rotation)
