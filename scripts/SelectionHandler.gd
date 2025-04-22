extends Node

## Emitted when selection changes with array of selected objects
signal selection_changed(selected: Array)
signal selection_modified(object: Node, selected: bool)

var selected_objects: Dictionary = {}  # Faster lookups than Array
var last_selected: Node = null

## Add/remove object from selection based on modifier keys
func handle_selection(object: Node, shift_pressed: bool) -> void:
	if shift_pressed:
		if selected_objects.has(object):
			selected_objects.erase(object)
			selection_modified.emit(object, false)
			if last_selected == object:
				last_selected = selected_objects.keys().front() if !selected_objects.is_empty() else null
		else:
			selected_objects[object] = true
			selection_modified.emit(object, true)
			last_selected = object
	else:
		if selected_objects.size() != 1 or !selected_objects.has(object):
			selected_objects = {object: true}
			selection_modified.emit(object, true)
			last_selected = object
	
	selection_changed.emit(selected_objects.keys())

## Clear all selections
func clear_selection() -> void:
	for obj in selected_objects:
		selection_modified.emit(obj, false)
	selected_objects.clear()
	last_selected = null
	selection_changed.emit([])

## Get primary selected object (for properties editing)
func get_primary_selection() -> Node:
	return last_selected if last_selected else selected_objects.keys().front() if !selected_objects.is_empty() else null
