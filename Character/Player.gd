extends "res://Character/Character.gd"

func control(delta):
	
	$Body.look_at(get_global_mouse_position())
	velocity = Vector2()
#	if Input.is_action_pressed("ui_right"):
#		velocity = Vector2(speed,0)
#	if Input.is_action_pressed("ui_left"):
#		velocity = Vector2(-speed,0)
#	if Input.is_action_pressed("ui_down"):
#		velocity = Vector2(0,speed)
#	if Input.is_action_pressed("ui_up"):
#		velocity = Vector2(0,-speed)
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		