extends Area2D

@export var mooz : Panel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var mouseIn = false
var clickMin = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mooz.inMooz:
		if(mouseIn and Input.is_action_pressed("interact")):
			clickMin = true
		if(clickMin and mouseIn and Input.is_action_just_released("interact")):
			clickMin = false
			mooz.end()


func _mouse_enter() -> void:
	mouseIn = true
	print("Mouse in")
func _mouse_exit() -> void:
	mouseIn = false
	print("Mouse out")
