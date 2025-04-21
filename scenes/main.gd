extends Node3D

@onready var Shapes = {
	"Cube": preload("res://scenes/Cube.tscn")
}

@onready var SpinCube = $UI/RotationIndicator/Viewport/SpinCube.CameraAnchor

func _ready():
	print("READY")

func _on_cube_button_pressed() -> void:
	print("BOOP")
	var cube = Shapes["Cube"].instantiate()
	$Model.add_child(cube)
	$Gizmo.select(cube)
	pass # Replace with function body.
