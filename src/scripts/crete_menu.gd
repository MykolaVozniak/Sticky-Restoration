extends Node2D

const CHAPTER_MENU: String = "res://src/scenes/menus/chapter_menu.tscn"
const LVL_1_1: String = "res://src/scenes/levels/lvl_1_1.tscn"

func _ready():
	pass

func _process(delta):
	pass

func _on_lvl_1_pressed():
	get_tree().change_scene_to_file(LVL_1_1)

func _on_back_button_pressed():
	get_tree().change_scene_to_file(CHAPTER_MENU)
