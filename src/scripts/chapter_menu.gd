extends Node2D

const CRETE_MENU = preload("res://src/scenes/menus/crete_menu.tscn")

func _ready():
	pass

func _process(delta):
	pass


func _on_crete_pressed():
	get_tree().change_scene_to_packed(CRETE_MENU)
