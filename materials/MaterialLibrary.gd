extends Node

class_name MaterialLibrary

const DEFAULT_MATERIAL := preload("res://materials/DefaultMaterial.tres")

var materials: Dictionary = {
	"Default": DEFAULT_MATERIAL,
	"Metal": preload("res://materials/Metal.tres"),
	"Glass": preload("res://materials/Glass.tres"),
	"Rubber": preload("res://materials/Rubber.tres")
}

func get_material(name: String) -> StandardMaterial3D:
	return materials.get(name, DEFAULT_MATERIAL).duplicate()

func get_material_list() -> PackedStringArray:
	return PackedStringArray(materials.keys())
