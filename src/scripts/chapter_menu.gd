extends Node2D

const MAIN_MENU: String = "res://src/scenes/menus/main_menu.tscn"
const CRETE_MENU: String = "res://src/scenes/menus/crete_menu.tscn"

func _ready():
	pass

func _process(delta):
	pass

func _on_crete_button_pressed():
	get_tree().change_scene_to_file(CRETE_MENU)

func _on_back_button_pressed():
	get_tree().change_scene_to_file(MAIN_MENU)
