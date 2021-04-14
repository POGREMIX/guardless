extends Node2D
export (PackedScene) var Player
export (PackedScene) var Zombie



var score


func _ready():
#	connect('update_health', $Player, update_health)
	
	new_game()
#	randomize()



func _process(delta):
	pass


func new_game():
	score = 0
	$HUD.update_score(score)
	
#	$HUD/StartButton.hide()
	
#	$StartTimer.start()

	var player = Player.instance()
	add_child(player)
	player.start($StartPosition.position)
	
	$HUD.update_health(player.health)
	player.connect('update_health', self, 'on_update_health')
	player.connect('death', self, 'on_death')
	
#	$HUD.show_message("Get Ready")

	
	var zombie = Zombie.instance()
	add_child(zombie)
	
	
	zombie.player_collision_shapes = player.PLAYER_COLLISION_SHAPES
	
	
	
func game_over():
	$HUD.show_game_over()


func on_update_health(value):
#	print('on_update_health'+str(value))
	$HUD.update_health(value)

func on_death():
	game_over()

