extends Node2D


func _ready():
		set_camera_limits()

func set_camera_limits():
	var map_limits = $Ground.get_used_rect()
	var map_cells = $Ground.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cells.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cells.x	
	$Player/Camera2D.limit_top = map_limits.position.y * map_cells.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cells.y

func _on_Character_shoot(projectile, _position, _direction):
	var p = projectile.instance()
	print("called") 
	add_child(p)
	p.start(_position, _direction)
