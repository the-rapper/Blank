extends Control

# In SettingsMenu.gd
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
