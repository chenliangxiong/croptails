extends CanvasModulate
class_name DayNightCycleComponent

@export var initial_day: int = 1:
	set(id):
		initial_day = id
		DayAndNightManager.initial_day = id
		DayAndNightManager.set_inital_time()

@export var initial_hour: int = 12:
	set(ih):
		initial_hour = ih
		DayAndNightManager.initial_hour = ih
		DayAndNightManager.set_inital_time()

@export var initial_minute: int = 12:
	set(im):
		initial_minute = im
		DayAndNightManager.initial_minute = im
		DayAndNightManager.set_inital_time()

@export var day_night_gradient_texture: GradientTexture1D

func _ready():
	DayAndNightManager.initial_day = initial_day
	DayAndNightManager.initial_hour = initial_hour
	DayAndNightManager.initial_minute = initial_minute
	DayAndNightManager.set_inital_time()

	DayAndNightManager.game_time.connect(on_game_time)

func on_game_time(time: float):
	var sample_value = 0.5 * (sin(time - PI * 0.5) + 1.0)
	color = day_night_gradient_texture.gradient.sample(sample_value)
