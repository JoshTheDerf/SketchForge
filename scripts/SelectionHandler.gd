extends Node

## Emitted when selection changes with array of selected objects
signal selection_changed(selected: Array)

var selected_objects: Array = []

## Add/remove object from selection based on shift state
func handle_selection(object: Node, shift_pressed: bool) -> void:
	if shift_pressed:
		if object in selected_objects:
			selected_objects.erase(object)
		else:
			selected_objects.append(object)
	else:
		selected_objects = [object]
	
	selection_changed.emit(selected_objects)

## Clear all selections
func clear_selection() -> void:
	selected_objects.clear()
	selection_changed.emit(selected_objects)
