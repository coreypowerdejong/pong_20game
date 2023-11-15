extends Node2D

var speed: float = 400
var screen_size: Vector2
var x_offset = Vector2(100, 0)
var y_offset = Vector2(0, 100)

var velocity = 0

var ball_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x - x_offset.x, screen_size.y / 2)
	$MoveTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball_position = $"../Ball".position

	position.y += velocity * delta * speed
	position = position.clamp(Vector2.ZERO + y_offset, screen_size - y_offset)
	

func _on_move_timer_timeout():
	if position.y > ball_position.y:
		velocity = -1
	else:
		velocity = 1

