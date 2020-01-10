extends KinematicBody2D

signal health_changed
signal dead
signal shoot

export (PackedScene) var Projectile
export (int) var speed
export (float) var rotation_speed
export (float) var weapon_cooldown
export (int) var health

var velocity = Vector2()
var can_shoot = true
var alive = true

func _ready():
	$Weapon_Cooldown.wait_time = weapon_cooldown

func control(delta):
	pass

func shoot():
	if can_shoot:
#		can_shoot = false
		print("shooting")
		$Weapon_Cooldown.start()
		var dir = Vector2(1,0).rotated($Weapon/equipment.global_rotation)
		emit_signal('shoot', Projectile, $Weapon/equipment.global_position, dir)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not alive:
		pass
	control(delta)
	move_and_collide(velocity * speed * delta)
	
func on_Weapon_Cooldown_Timer():
	can_shoot = true