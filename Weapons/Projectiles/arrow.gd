extends Area2D

var direction: Vector2
var speed := 300.

func init(_direction: Vector2):
	direction = _direction.normalized()
	look_at(global_position + direction)

func _init():
	body_entered.connect(_on_body_entered)

func _process(delta: float):
	position += direction * speed * delta

func _on_body_entered(body: Node2D):
	if body is Living:
		body.take_damage()
	queue_free()
