extends Node2D

var balloon_scene = preload("res://dialogue/game_dialogue_balloon.tscn")

@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent

var in_range: bool

func _ready():
    interactable_component.interactable_actived.connect(on_interactable_activated)
    interactable_component.interactable_deactived.connect(on_interactable_deactivated)
    interactable_label_component.hide()

    GameDialogueManager.give_crop_seeds.connect(on_give_crop_seeds)

func on_interactable_activated():
    interactable_label_component.show()
    in_range = true

func on_interactable_deactivated():
    interactable_label_component.hide()
    in_range = false

func _unhandled_input(event: InputEvent) -> void:
    if in_range:
        if event.is_action_pressed("show_dialogue"):
            var balloon: BaseGameDialogueBalloon = balloon_scene.instantiate()
            get_tree().current_scene.add_child(balloon)
            balloon.start(load("res://dialogue/conversations/guide.dialogue"), "start")

func on_give_crop_seeds():
    ToolManager.enable_tool_button(DataTypes.Tools.TillGround)
    ToolManager.enable_tool_button(DataTypes.Tools.WaterCrops)
    ToolManager.enable_tool_button(DataTypes.Tools.PlantCorn)
    ToolManager.enable_tool_button(DataTypes.Tools.PlantTomato)