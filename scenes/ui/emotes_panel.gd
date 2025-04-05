extends Panel

@onready var animated_sprite_2d: AnimatedSprite2D = $Emote/AnimatedSprite2D
@onready var emote_idle_timer: Timer = $EmoteIdleTimer

var idle_emotes: Array = ["emote_1_idle", "emote_2_smile", "emote_3_ear_wave", "emote_4_blink"]

func _ready():
    animated_sprite_2d.play(idle_emotes[0])

    InventoryManager.inventory_changed.connect(on_inventory_changed)
    GameDialogueManager.feed_the_animals.connect(on_feed_the_animals)

func play_emote(animation: String):
    animated_sprite_2d.play(animation)

func _on_emote_idle_timer_timeout():
    var index = randi_range(0, 3)
    var emote = idle_emotes[index]

    animated_sprite_2d.play(emote)

func on_inventory_changed():
    animated_sprite_2d.play("emote_7_excited")

func on_feed_the_animals():
    animated_sprite_2d.play("emote_6_love_kiss")