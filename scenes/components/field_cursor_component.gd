extends Node2D

class_name FieldCursorComponent

@export var grass_tilemap_layer: TileMapLayer
@export var tiled_soil_tilemap_layer: TileMapLayer
@export var terrain_set: int = 0
@export var terrain: int = 1

@onready var player: Player = get_tree().get_first_node_in_group("player")

var mouse_position: Vector2
var cell_position: Vector2
var cell_sources_id: int
var local_cell_position: Vector2
var distance: float

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("remove_dirt"):
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse()
			remove_tilled_soil_cell()
	elif event.is_action_pressed("hit"):
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse()
			add_tilled_soil_cell()

func get_cell_under_mouse():
	mouse_position = grass_tilemap_layer.get_local_mouse_position()
	cell_position = grass_tilemap_layer.local_to_map(mouse_position)
	cell_sources_id = grass_tilemap_layer.get_cell_source_id(cell_position)
	local_cell_position = grass_tilemap_layer.map_to_local(cell_position)
	distance = player.global_position.distance_to(local_cell_position)

	# print("mouse position: ", mouse_position, "cell position: ",
	#  cell_position, "cell_sources_id:", cell_sources_id, " distance:", distance)

func add_tilled_soil_cell():
	if distance < 20.0 && cell_sources_id != 1:
		tiled_soil_tilemap_layer.set_cells_terrain_connect([cell_position], terrain_set, terrain, true)

func remove_tilled_soil_cell():
	if distance < 20.0:
		tiled_soil_tilemap_layer.set_cells_terrain_connect([cell_position], 0, -1, true)