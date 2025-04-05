extends Node

func _ready():
    call_deferred("enable_tool_buttons")

func enable_tool_buttons():
    ToolManager.enable_tool_button(DataTypes.Tools.TillGround)
    ToolManager.enable_tool_button(DataTypes.Tools.WaterCrops)
    ToolManager.enable_tool_button(DataTypes.Tools.PlantCorn)
    ToolManager.enable_tool_button(DataTypes.Tools.PlantTomato)
