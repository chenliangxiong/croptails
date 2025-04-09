extends Node2D

func _ready():
    call_deferred("set_scene_process_mode")

func set_scene_process_mode():
    process_mode = PROCESS_MODE_DISABLED
