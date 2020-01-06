extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()
onready var raycast = $RayCast2D
func get_input(delta):
	
	var mov_vec = Vector2()
	
	if Input.is_action_pressed('ui_down'):
		mov_vec.y +=1 
	if Input.is_action_pressed('ui_up'):
		mov_vec.y -=1  
	if Input.is_action_pressed('ui_right'):
		mov_vec.x +=1 
	if Input.is_action_pressed('ui_left'):
		mov_vec.x -=1 
	
	mov_vec = mov_vec.normalized()
	move_and_collide(mov_vec * speed * delta)
	
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y,look_vec.x)

	if Input.is_action_just_pressed("ui_select"):
		var coll = raycast.get_collider()
		if raycast.is_colliding() and coll.has_method("kill"):
			coll.kill()
 
func kill():
    get_tree().reload_current_scene()

func _physics_process(delta):
    get_input(delta)


