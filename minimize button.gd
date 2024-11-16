extends TextureButton

@export var mooz : Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var press = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("Button running")
	if self.button_down:
		press = true
	if self.button_up and pressed:
		press = false
		print("Button pressed")
		mooz.end()
		pass
	pass
