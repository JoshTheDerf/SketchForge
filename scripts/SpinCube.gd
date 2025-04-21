extends Node3D

@onready var CameraAnchor = $CameraAnchor

signal update_target(target_rotation: Vector3)

func _on_front_update_target(target_rotation: Vector3) -> void:
	emit_signal("update_target", target_rotation)
