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
	
	# Update properties panel
	$UI/PropertiesPanel.visible = !selected.is_empty()
	$UI/PropertiesPanel/VBox/Header.text = "Selected Objects: %d" % selected.size()
	
	# Update color picker with first selected object's color
	if !selected.is_empty():
		var mat = selected[0].material as StandardMaterial3D
		if mat:
			$UI/PropertiesPanel/VBox/ColorPicker.color = mat.albedo_color

func _ready():
	selection_handler.selection_changed.connect(_on_selection_changed)
	$UI/PropertiesPanel/VBox/ColorPicker.color_changed.connect(_on_color_changed)

func _on_color_changed(color: Color) -> void:
	for obj in selection_handler.selected_objects:
		var mat = obj.material as StandardMaterial3D
		if mat:
			mat.albedo_color = color

func _ready():
	print("READY")

func _on_cube_button_pressed() -> void:
	print("BOOP")
	var cube = Shapes["Cube"].instantiate()
	$Model.add_child(cube)
	$Gizmo.select(cube)
	pass # Replace with function body.
