extends Node2D

var player1_score: int = 0
var player2_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_left_score():
	player1_score += 1
	$Player1Score.text = str(player1_score)


func _on_ball_right_score():
	player2_score += 1
	$Player2Score.text = str(player2_score)
