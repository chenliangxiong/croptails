extends CharacterBody2D
class_name Player

@onready var hit_component: HitComponent = $HitComponent;
@export var current_tool: DataTypes.Tools = DataTypes.Tools.None

var player_direction: Vector2

func _ready() -> void:
    ToolManager.tool_selected.connect(on_tool_selected)

func on_tool_selected(tool: DataTypes.Tools):
    current_tool = tool
    hit_component.current_tool = tool