extends Node
class_name InventoryManager

var inventory: Dictionary = Dictionary()

signal inventory_changed

func add_collectable(collectable_name: String):
	inventory.get_or_add(collectable_name)
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 1
	else:
		inventory[collectable_name] += 1
	inventory_changed.emit()