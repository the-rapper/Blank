extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _get_drag_data(at_position: Vector2) -> Variant:
	print("dragged")
	var preview = self.duplicate()
	self.hide()
	preview.modulate.a =1 
	self.mouse_filter = Control.MOUSE_FILTER_STOP
	set_drag_preview(preview)
	return self
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
