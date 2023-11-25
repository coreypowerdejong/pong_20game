extends Area2D

var screen_size: Vector2
var speed = 400
var direction: float
var velocity: Vector2
var width = 20
signal left_score
signal right_score

func reset():
	position = screen_size * 0.5
	direction = randf_range(0, 2 * PI)
	velocity = Vector2(1,0).rotated(direction)
	show()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * speed * delta
	
	# bounce on top or bottom
	if position.y - width <= 0 or position.y + width >= screen_size.y:
		velocity.y *= -1
	
	#detect exit on left or right
	if position.x - width <= 0:
		emit_signal("right_score")
		reset()
		
	if position.x + width >= screen_size.x:
		emit_signal("left_score")
		reset()
	


func _on_area_entered(area):
	direction = randf_range(-PI/3, PI/3)
	if position.x < screen_size.x / 2:
		velocity = Vector2(1,0).rotated(direction)
	else:
		velocity = Vector2(-1,0).rotated(direction)
	
