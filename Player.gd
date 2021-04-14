extends KinematicBody2D

signal death
signal update_health(value)

export var speed = 400
export var health = 100
var velocity = Vector2() 
var screen_size

enum PLAYER_COLLISION_SHAPES {WALK_COLLISION = 0, HEALTH_COLLISION = 1}


func _ready():
	screen_size = get_viewport_rect().size


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	
func _physics_process(delta):
	get_input()
	velocity  = move_and_slide(velocity)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		velocity = velocity.bounce(collision.normal)#


	
		
func start(pos):
	position = pos
	show()
	$HealthCollision.disabled = false


func take_damage():
#	print("take_damage")
	
	health -= 10
	emit_signal('update_health', health)
	
	if health <= 0:
		print('death')
		hide()
		$WalkCollision.set_deferred("disabled", true)
		$HealthCollision.set_deferred("disabled", true)
		emit_signal("death")

		
#	position = position - 50
	


