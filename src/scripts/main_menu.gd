extends Node2D

const CHAPTER_MENU = preload("res://src/scenes/chapter_menu.tscn")

func _ready():
	pass

func _process(delta):
	pass

func _on_quit_button_pressed():
	get_tree().quit()

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(CHAPTER_MENU)
