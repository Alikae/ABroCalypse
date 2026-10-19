extends Living

var wanted_player_distance := 80.
var shoot_angle := 0.
var spit_cooldown := .1
var spit_timer := spit_cooldown

func _init():
	speed = 200.

func ai(delta: float)-> Vector2:
	var self_to_player = GLOBAL.player.global_position - global_position
	var wanted_pos = GLOBAL.player.global_position - self_to_player.normalized() * wanted_player_distance
	var move: Vector2 = wanted_pos - global_position

	spit_timer -= delta
	if spit_timer < 0.:
		spit_timer += spit_cooldown
		shoot_angle += randf()
		primary_shoot(Vector2(cos(shoot_angle), sin(shoot_angle)))

	return move

func primary_shoot(direction: Vector2)-> void:
	var spit = preload("res://Weapons/Projectiles/spit_projectile.tscn").instantiate()
	GLOBAL.game.add_projectile(spit, global_position)
	spit.init(direction)

func secondary_shoot(_direction: Vector2)-> void:
	pass
