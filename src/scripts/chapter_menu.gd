extends Node2D

const CRETE_MENU = preload("res://src/scenes/menus/crete_menu.tscn")
const MAIN_MENU = preload("res://src/scenes/menus/main_menu.tscn")

func _ready():
	pass

func _process(delta):
	pass

func _on_crete_button_pressed():
	get_tree().change_scene_to_packed(CRETE_MENU)

func _on_back_button_pressed():
	get_tree().change_scene_to_packed(MAIN_MENU)
