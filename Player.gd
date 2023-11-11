extends Node2D

var speed: float = 400
var screen_size: Vector2
var x_offset = Vector2(100, 0)
var y_offset = Vector2(0, 100)

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(x_offset.x, screen_size.y / 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = 0
	if Input.is_action_pressed("up"):
		velocity -= 1
	if Input.is_action_pressed("down"):
		velocity += 1
	
	velocity = velocity * speed
	position.y += velocity * delta
	position = position.clamp(Vector2.ZERO + y_offset, screen_size - y_offset)

