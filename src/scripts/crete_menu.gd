extends Node2D

const CRETE_LVL_1 = preload("res://src/scenes/crete_lvl1.tscn")

func _ready():
	pass

func _process(delta):
	pass

func _on_lvl_1_pressed():
	get_tree().change_scene_to_packed(CRETE_LVL_1)
