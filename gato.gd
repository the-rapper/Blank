extends Node3D
@export var timeout = 15
@export var odds = 0.35
@onready var timer = get_tree().create_timer(timeout)
@onready var ray = get_node("RayCast3D")
var dir = Vector3(0,0,1)
@export var speed = 0.003
var silly = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.connect("timeout", try_and_retry)
	pass # Replace with function body.

func try_and_retry() -> void:
	print("TRYINGING")
	if(float((randi() % 100) + 1) / 100 <= odds):
		silly = true
	reset_timer()
	return
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if silly:
		silly_step()
	pass
func reset_timer() -> void:
	if timer: 
		timer.disconnect("timeout", try_and_retry)
		timer = get_tree().create_timer(timeout) 
		timer.connect("timeout", try_and_retry)
func calm() -> void:
	reset_timer()
	silly = false
	print("calm")
func silly_step() -> void:
	if not ray.is_colliding():
		print("ping")
		dir = -dir
		position += dir * speed * 4
	position += dir * speed
	
	
