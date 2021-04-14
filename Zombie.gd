extends KinematicBody2D


export var speed = 150
var velocity = Vector2() 
#enum CollisionShapes {WALK_COLLISION = 0, HEALTH_COLLISION = 1}
var player_collision_shapes


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "walk"


func _physics_process(delta):
	velocity  = move_and_slide(velocity)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collidedWithPlayer(collision)):
			if collision.collider.has_method("take_damage"):

				collision.collider.take_damage()
		
		
func collidedWithPlayer(collision):
	return collision.collider_shape_index == player_collision_shapes.HEALTH_COLLISION
		 
