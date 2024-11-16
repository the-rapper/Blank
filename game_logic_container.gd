extends Node

@export var participation = 100
@export var is_participating = false
@export var last_participation = 0 # time since last participated

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_participating:
		participation += delta * 0.01
		last_participation = 0
	elif last_participation > 10:
		participation -= delta * 0.01
		last_participation += delta
	else:
		last_participation += delta
	pass

func start_participating() -> void:
	is_participating = true

func stop_participating() -> void:
	is_participating = false
