extends Node2D

var player1_score: int = 0
var player2_score: int = 0
var paused: bool = true
var win_score: int = 5
var multiplayer_flag: bool = false

func setup_players():
	$Player1.setup()
	$Player2.setup()
	$AIPlayer.setup()

# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/Pause/PauseMenu.hide()
	$Ball.hide()
	$UI/GameOverScreen.hide()
	
	$AIPlayer.set_visible(!multiplayer_flag)
	$AIPlayer/Paddle/CollisionShape2D.disabled = multiplayer_flag
	
	$Player2.set_visible(multiplayer_flag)
	$Player2/Paddle/CollisionShape2D.disabled = !multiplayer_flag


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI/Scoreboard/Player1Score.text = str(player1_score)
	$UI/Scoreboard/Player2Score.text = str(player2_score)
	$UI/HomeScreen/PointSelector/PointCount.text = "Score to win: " + str(win_score)
	
	$Ball.get_tree().paused = paused
	$Player1.get_tree().paused = paused
	$Player2.get_tree().paused = paused
	$AIPlayer.get_tree().paused = paused
	
	if not paused:
		$UI/PauseButton.show()
	else:
		$UI/PauseButton.hide()
	
	
	if player1_score == win_score or player2_score == win_score:
		$Ball.hide()
		var winner: int = 1 if player1_score > player2_score else 2
		$UI/GameOverScreen/GameOverText.text = "Game Over!\nPlayer " + str(winner) + " wins!"
		$UI/GameOverScreen.show()
		paused = true
		


func _on_ball_left_score():
	player1_score += 1

func _on_ball_right_score():
	player2_score += 1

func _on_pause_button_pressed():
	$UI/Pause/PauseMenu.show()
	paused = true



func _on_resume_pressed():
	paused = false
	$UI/Pause/PauseMenu.hide()


func _on_restart_pressed():
	player1_score = 0
	player2_score = 0
	$Ball.reset()
	paused = false
	$UI/Pause/PauseMenu.hide()
	$UI/GameOverScreen.hide()
	setup_players()


func _on_increase_pressed():
	if win_score < 15:
		win_score += 1



func _on_decrease_pressed():
	if win_score > 1:
		win_score -= 1


func _on_quit_pressed():
	player1_score = 0
	player2_score = 0
	paused = true
	$Ball.hide()
	$UI/Pause/PauseMenu.hide()
	$UI/GameOverScreen.hide()
	$UI/HomeScreen.show()
	

func _on_start_game_pressed():
	paused = false
	$Ball.reset()
	$Ball.show()
	$UI/HomeScreen.hide()
	setup_players()


func _on_player_count_toggled(button_pressed):
	multiplayer_flag = !multiplayer_flag
	$UI/HomeScreen/PlayerCount.text = "Multiplayer" if multiplayer_flag else "Singleplayer"
	
	$AIPlayer.set_visible(!multiplayer_flag)
	$AIPlayer/Paddle/CollisionShape2D.disabled = multiplayer_flag
	
	$Player2.set_visible(multiplayer_flag)
	$Player2/Paddle/CollisionShape2D.disabled = !multiplayer_flag
	
