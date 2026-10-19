extends Node2D
class_name InteractionSpotPool

var spots: Array

var spot_space := 50.

static func create(_spots: Array)-> InteractionSpotPool:
	var pool = preload("res://InteractionSpot/interaction_spot_pool.tscn").instantiate()
	pool.init(_spots)
	return pool

func init(_spots: Array):
	spots = _spots
	for spot in spots:
		spot.picked.connect(_on_spot_picked)

func _ready():
	var begin_x = -(spots.size() - 1) * spot_space / 2.
	for spot in spots:
		add_child(spot)
		spot.position.x = begin_x
		begin_x += spot_space

func _on_spot_picked():
	queue_free()
