class_name GameDialogueBalloon extends BaseGameDialogueBalloon

@onready var emotes_panel: Panel = $Balloon/Panel/Dialogue/HBoxContainer/EmotesPanel

func start(dialogue_resource: DialogueResource, titile: String, extra_game_states: Array = []):
    super.start(dialogue_resource, titile, extra_game_states)
    emotes_panel.play_emote("emote_12_talking")

func next(next_id: String):
    super.next(next_id)
    emotes_panel.play_emote("emote_12_talking")