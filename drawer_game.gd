extends Panel

@onready var w = size.x
@onready var h = size.y
@export var sprite_options = []
@export var n = 15
@export var clutter_script : Script
@export var popups : Panel
@export var goal : Control
var state = {}
var created = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func begin() -> void:
	goal.position = rand_point()
	setup()
	create_clutter()
func end():
	state = {}
	clear_clutter()
	popups.exit()
func clear_clutter():
	for clutter in created:
		clutter.queue_free()
	created = []
func create_clutter():
	for point in state:
		var clutter = TextureRect.new()
		clutter.position = point
		clutter.texture = state[point]
		clutter.set_script(clutter_script)
		add_child(clutter)
func setup(): 
	for i in range(0,n):
		state[rand_point()] = rand_sprite()
func rand_point() -> Vector2:
	return Vector2(randi_range(0,w), randi_range(0,h))	 
func rand_sprite():
	return sprite_options[randi() % len(sprite_options)]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
