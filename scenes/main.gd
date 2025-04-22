extends Node3D

@onready var Shapes = {
	"Cube": preload("res://scenes/Cube.tscn")
}

@onready var SpinCube = $UI/RotationIndicator/Viewport/SpinCube.CameraAnchor
@onready var selection_handler = $SelectionHandler

func _ready():
	selection_handler.selection_changed.connect(_on_selection_changed)

func _on_selection_changed(selected: Array) -> void:
	$Gizmo.clear_selection()
	for obj in selected:
		$Gizmo.select(obj)

func _ready():
	print("READY")

func _on_cube_button_pressed() -> void:
	print("BOOP")
	var cube = Shapes["Cube"].instantiate()
	$Model.add_child(cube)
	$Gizmo.select(cube)
	pass # Replace with function body.
