extends Control

@onready var background_layer = $ParallaxBackground
@onready var title = $TitleLabel
@onready var menu_container = $MarginContainer/MenuItems
@onready var animation_player = $AnimationPlayer
@onready var transition_overlay = $TransitionOverlay

func _ready():
	print("Main Menu Script Starting...")
	print("Setting up input...")
	set_process_input(true)
	
	# Get button references
	var start_button = $MarginContainer/MenuItems/StartButton
	var settings_button = $MarginContainer/MenuItems/SettingsButton
	var credits_button = $MarginContainer/MenuItems/CreditsButton
	var quit_button = $MarginContainer/MenuItems/QuitButton
	
	# Debug prints
	print("Background Layer exists: ", background_layer != null)
	print("Title exists: ", title != null)
	print("Animation Player exists: ", animation_player != null)
	print("Transition Overlay exists: ", transition_overlay != null)
	print("MenuItems exists: ", menu_container != null)
	
	if start_button:
		print("Start Button visibility: ", start_button.visible)
		print("Start Button mouse filter: ", start_button.mouse_filter)
		print("Connecting Start button signals")
		start_button.pressed.connect(_on_start_pressed)
		start_button.mouse_entered.connect(func(): _on_button_hover(start_button))
		start_button.mouse_exited.connect(func(): _on_button_normal(start_button))
	
	if settings_button:
		print("Connecting Settings button signals")
		settings_button.pressed.connect(_on_settings_pressed)
		settings_button.mouse_entered.connect(func(): _on_button_hover(settings_button))
		settings_button.mouse_exited.connect(func(): _on_button_normal(settings_button))
	
	if quit_button:
		print("Connecting Quit button signals")
		quit_button.pressed.connect(_on_quit_pressed)
		quit_button.mouse_entered.connect(func(): _on_button_hover(quit_button))
		quit_button.mouse_exited.connect(func(): _on_button_normal(quit_button))

func _on_button_hover(button: Button):
	print("Button hover")
	var tween = create_tween()
	tween.tween_property(button, "scale", Vector2(1.1, 1.1), 0.1)

func _on_button_normal(button: Button):
	print("Button unhover")
	var tween = create_tween()
	tween.tween_property(button, "scale", Vector2(1.0, 1.0), 0.1)

func _on_start_pressed():
	print("Start button pressed!")
	transition_to_scene("res://MainRoom.tscn")

func _on_settings_pressed():
	print("Settings pressed!")
	transition_to_scene("res://scenes/settings.tscn")

func _on_quit_pressed():
	print("Quit pressed!")
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	get_tree().quit()

func transition_to_scene(next_scene: String):
	print("Trying to transition to: ", next_scene)
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(next_scene)
