extends Area2D
class_name InteractionSpot

class Data:
	var sprite: Texture
	var activation_func: Callable
	func _init(_sp: Texture, af: Callable):
		sprite = _sp
		activation_func = af
static var DATA := {
	"speed_up": Data.new(
		preload("res://Assets/speed_up.png"),
		func a(_s):
	GLOBAL.player.speed += 50.
	),
	"chest": Data.new(
		preload("res://Assets/chest.png"),
		func a(_s):
	var pool = 	InteractionSpotPool.create([
		InteractionSpot.create("speed_up"),
		InteractionSpot.create("speed_up"),
		InteractionSpot.create("chest"),
	])
	GLOBAL.game.add_interaction_spot_pool.call_deferred(pool, _s.global_position + Vector2(0., 50.))
	),
	"quest_caged_friend": Data.new(
		preload("res://Assets/quest_interrogation_point.png"),
		func a(_s):
	var pool = InteractionSpotPool.create([
		InteractionSpot.create("quest_caged_friend_key", false, _s.custom_data),
	])
	GLOBAL.game.add_interaction_spot_pool.call_deferred(pool, _s.global_position + Vector2(randf(), randf()).normalized() * 500.)
	# Give player quest TODO
	),
	"quest_caged_friend_key": Data.new(
		preload("res://Assets/quest_caged_friend_key.png"),
		func a(_s):
	QUESTS.caged_friend_keys.append(_s.custom_data)
	)
}

var activation_func: Callable
var custom_data
signal picked()

static func create(type: String, have_background := true, _custom_data = null)-> InteractionSpot:
	var spot = preload("res://InteractionSpot/interaction_spot.tscn").instantiate()
	spot.init(DATA[type], have_background, _custom_data)
	return spot

func _init():
	body_entered.connect(_on_body_entered)

func init(data: Data, have_background: bool, _custom_data):
	if not have_background:
		$Sprite2D.visible = false
	$Sprite2D2.texture = data.sprite
	activation_func = data.activation_func
	custom_data = _custom_data

func _on_body_entered(_body: Node2D)-> void:
	activation_func.call(self)
	picked.emit()
	queue_free()
