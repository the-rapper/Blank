extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		var result = cast_mouse_ray()
		if result.has("collider") and Globals.can_interact:
			var clicked = result.get("collider")
			if(clicked.has_method("hit")): clicked.hit()
			
		
	pass

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
