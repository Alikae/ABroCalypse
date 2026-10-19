extends Node
class_name Game

func _ready():
	GLOBAL.game = self
	GLOBAL.player = get_node("Livings/Player")

	var chest = InteractionSpotPool.create([
		InteractionSpot.create("chest", false)
	])
	add_interaction_spot_pool(
		chest, Vector2(150., 0.)
	)
	
	var caged = preload("res://Quests/caged_friend.tscn").instantiate()
	add_child(caged)
	caged.position = Vector2(randf(), randf()) * 1500.
	caged.init()

func add_interaction_spot_pool(pool: InteractionSpotPool, position: Vector2):
	$InteractionSpots.add_child(pool)
	pool.position = position

func add_projectile(projectile: Node2D, position: Vector2)-> void:
	$Projectiles.add_child(projectile)
	projectile.position = position

func add_living(living: Living, position: Vector2):
	$Livings.add_child(living)
	living.position = position
