extends Node
class_name CSGManager

enum Operation { UNION, SUBTRACT, INTERSECT }

static func perform_operation(op: Operation, base: CSGShape3D, modifier: CSGShape3D) -> CSGCombiner3D:
	var result := CSGCombiner3D.new()
	
	match op:
		Operation.UNION:
			result.operation = CSGCombiner3D.OPERATION_UNION
		Operation.SUBTRACT:
			result.operation = CSGCombiner3D.OPERATION_SUBTRACTION
		Operation.INTERSECT:
			result.operation = CSGCombiner3D.OPERATION_INTERSECTION
	
	# Preserve transforms
	var base_parent = base.get_parent()
	var modifier_parent = modifier.get_parent()
	
	base.reparent(result)
	modifier.reparent(result)
	
	# Return to original parents if needed
	if base_parent:
		result.add_child(base)
		base.reparent(base_parent)
	if modifier_parent:
		result.add_child(modifier)
		modifier.reparent(modifier_parent)
	
	return result
