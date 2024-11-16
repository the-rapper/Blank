extends Area3D
@export var popups : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func hit() -> void:
	if(popups.chosen == null):
		popups.pop_up("mooz")
	
