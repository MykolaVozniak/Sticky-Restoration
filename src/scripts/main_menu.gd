extends Node2D

const CHAPTER_MENU = preload("res://src/scenes/menus/chapter_menu.tscn")
const JOURNAL_SCREEN = preload("res://src/scenes/screens/journal_screen.tscn")
const SETTINGS_SCREEN = preload("res://src/scenes/screens/settings_screen.tscn")

func _ready():
	pass

func _on_quit_button_pressed():
	get_tree().quit()

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(CHAPTER_MENU)

func _on_journal_button_pressed():
	var node = JOURNAL_SCREEN.instantiate()
	add_child(node)
	
func _on_settings_button_pressed():
	var node = SETTINGS_SCREEN.instantiate()
	add_child(node)
