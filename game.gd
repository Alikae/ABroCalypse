extends Node
class_name Game

func _ready():
	GLOBAL.game = self
	GLOBAL.player = get_node("Livings/Player")


func add_projectile(projectile: Node2D)-> void:
	$Projectiles.add_child(projectile)
