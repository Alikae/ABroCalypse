extends CharacterBody2D
class_name Living

var speed := 250.

func _process(delta: float)-> void:
	var input := ai(delta)
	velocity = input.normalized() * speed
	move_and_slide()

func ai(_delta: float)-> Vector2:
	return Vector2.ZERO

func primary_shoot(_direction: Vector2)-> void:
	pass

func secondary_shoot(_direction: Vector2)-> void:
	pass

func take_damage():
	print(self, " says: 'Aïe!'")
