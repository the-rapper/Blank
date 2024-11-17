extends TextureRect

@onready var x = get_parent().size.x
@onready var y = get_parent().size.y
var dir = Vector2(size.x, size.y)
@export var speed = .50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func random_dir() -> Vector2:
	dir = dir.rotated(deg_to_rad(randi() % 360))
	return dir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x >= x or position.x <= 0:
		dir.x *= -1
	elif position.y >= y or position.y <= 0:
		dir.y *= -1
	elif randi() % 100 >= 65:
		dir = random_dir()
	lerp(position, dir, speed)
