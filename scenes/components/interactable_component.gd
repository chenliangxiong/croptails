extends Area2D
class_name InteractableComponent

signal interactable_actived
signal interactable_deactived

func _on_body_entered(_body: Node2D) -> void:
	interactable_actived.emit()

func _on_body_exited(_body: Node2D) -> void:
	interactable_deactived.emit()
