extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is TextureRect

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.position = at_position
	data.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
