extends Area3D

@onready var dad = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func rustle() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(dad, "scale", Vector3(1.3,0.7,1), 0.1)
	tween.tween_property(dad, "scale", Vector3(0.7,1.3,1), 0.1)
	tween.tween_property(dad, "scale", Vector3(1,1,1), 0.1)
	
	dad.rustles -= 1
	if dad.rustles <= 0:
		dad.exit()
