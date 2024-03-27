extends Node2D

const MAIN_MENU = preload("res://src/scenes/menus/main_menu.tscn")

func _on_timer_timeout():
	get_tree().change_scene_to_packed(MAIN_MENU)
