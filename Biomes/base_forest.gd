extends Node2D

var tree = preload("res://Biomes/Obstacles/tree.tscn")
var rock = preload("res://Biomes/Obstacles/rock.tscn")

var map_size = 1000.

func _ready():
	for i in 40:
		var r = rock.instantiate()
		add_child(r)
		r.global_position = Vector2(randf() * map_size, randf() * map_size)
	for i in 160:
		var t = tree.instantiate()
		add_child(t)
		t.global_position = Vector2(randf() * map_size, randf() * map_size)
