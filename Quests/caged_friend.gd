extends StaticBody2D

var quest_id = QUESTS.generate_id()

func init()-> void:
	GLOBAL.game.add_interaction_spot_pool(
		InteractionSpotPool.create([
			InteractionSpot.create("quest_caged_friend", true, quest_id)
		]),
		global_position + Vector2(0., 30.)
	)
	$Area2D.body_entered.connect(_on_body_entered)

func _on_body_entered(_body: Node2D)-> void:
	if QUESTS.caged_friend_keys.has(quest_id):
		QUESTS.caged_friend_keys.erase(quest_id)
		GLOBAL.game.add_living.call_deferred(preload("res://Livings/Friends/archer.tscn").instantiate(), global_position)
		queue_free()
