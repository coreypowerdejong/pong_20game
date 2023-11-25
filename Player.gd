extends Node2D

var speed: float = 400
var screen_size: Vector2
var x_offset = Vector2(100, 0)
var y_offset = Vector2(0, 100)
@export var player1: bool

func setup():
	if player1:
		position = Vector2(x_offset.x, screen_size.y / 2)
	else:
		position = Vector2(screen_size.x - x_offset.x, screen_size.y / 2)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = 0
	if player1:
		if Input.is_action_pressed("p1_up"):
			velocity -= 1
		if Input.is_action_pressed("p1_down"):
			velocity += 1
	else:
		if Input.is_action_pressed("p2_up"):
			velocity -= 1
		if Input.is_action_pressed("p2_down"):
			velocity += 1
	
	velocity = velocity * speed
	position.y += velocity * delta
	position = position.clamp(Vector2.ZERO + y_offset, screen_size - y_offset)

