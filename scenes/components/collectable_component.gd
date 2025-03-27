extends Area2D

class_name CollectableComponent

@export var coollectable_name: String

func _on_body_entered(body: Node2D):
	if body is Player:
		print("Collected")
		get_parent().queue_free()
