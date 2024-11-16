extends Node3D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var turn_deg = 0.0
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("look_left"):
		turn_deg += 90
	elif Input.is_action_just_pressed("look_right"):
		turn_deg -= 90
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation_degrees", Vector3(0,turn_deg,0), 0.1)
	pass
