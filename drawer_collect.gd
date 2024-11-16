extends Area2D

var hover = false
@export var drawer : Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _mouse_enter() -> void:
	hover = true
func _mouse_exit() -> void:
	hover = false
func end(): 
	drawer.end()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("interact") and hover:
		drawer.end()
	pass
	
