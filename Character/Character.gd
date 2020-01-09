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
	pass # Replace with function body.

func control(delta):
	pass

func shoot():
	if can_shoot:
		can_shoot = false
		$Weapon_Cooldown.start()
#		var dir = Vector2().rotated($Body.global_rotation)
		var dir = Vector2().rotated($Weapon.global_rotation)
		emit_signal('shoot', Projectile, $Weapon/equipment.global_position, dir)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not alive:
		pass
	control(delta)
#	move_and_slide(velocity * speed * delta)
	move_and_collide(velocity * speed * delta)