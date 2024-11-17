extends Node3D
@export var calmness_min = -5
@export var timeout = 15
@export var odds = 0.3
@onready var timer = get_tree().create_timer(timeout)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func try_and_retry() -> void:
	return
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
