extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var pressed = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var temp = cast_mouse_ray()
	if temp.has("collider"):
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)

	
	if Globals.can_interact:
		if Input.is_action_just_pressed("interact"):
			pressed = true
		if Input.is_action_just_released("interact") and pressed:
			pressed = false
			var result = cast_mouse_ray()
			if result.has("collider") and Globals.can_interact:
				var clicked = result.get("collider")
				if(clicked.has_method("hit")): clicked.hit()
				elif(clicked.has_method("rustle")): clicked.rustle()
				else: print("Object has hitbox but no defined behavior as of yet")

func cast_mouse_ray():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 100
	var from = project_ray_origin(mouse_pos)
	var to = from + project_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	ray_query.collide_with_areas = true
	return space.intersect_ray(ray_query)
