extends "res://Character/Character.gd"

func control(delta):
#	$Player.look_at(get_global_mouse_position())
	
	#$Body.look_at(get_global_mouse_position())
	$Weapon.look_at(get_global_mouse_position())
	velocity = Vector2()
		
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_select"):
		shoot()
	