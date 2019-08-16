extends KinematicBody2D

const UP = Vector2(0, -1)
var move = Vector2()

func _process(delta):
	move.y += 1.5
	if Input.is_action_pressed("ui_right"):
		move.x = min(600, move.x + 2)
	elif Input.is_action_pressed("ui_left"):
		move.x = max(-600, move.x - 2)
	elif move.x > 0:
		move.x -= 1
	elif move.x < 0:
		move.x += 1

	if is_on_floor():
		move.y = 0
		if Input.is_action_pressed("ui_up"):
			move.y = -1000
		
	move_and_slide(move, UP)