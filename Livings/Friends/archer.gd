extends Living

var shoot_cooldown := .8
var shoot_timer := shoot_cooldown

var wanted_player_distance := 30.

func ai(_delta: float)-> Vector2:
	var self_to_player = GLOBAL.player.global_position - global_position
	var wanted_pos = GLOBAL.player.global_position - self_to_player.normalized() * wanted_player_distance
	var move: Vector2 = wanted_pos - global_position

	shoot_timer -= _delta
	if shoot_timer <= 0.:
		shoot_timer += shoot_cooldown
		var min_distance := INF
		var closest_ennemy: Living = null
		for body in $Area2D.get_overlapping_bodies():
			var d = (body.global_position - global_position).length()
			if d < min_distance:
				min_distance = d
				closest_ennemy = body
		if closest_ennemy != null:
			primary_shoot(closest_ennemy.global_position - global_position)
	return move


func primary_shoot(direction: Vector2):
	var arrow = preload("res://Weapons/Projectiles/arrow.tscn").instantiate()
	GLOBAL.game.add_projectile(arrow, global_position)
	arrow.init(direction)
