extends Node2D

const LVL_1_1 = preload("res://src/scenes/levels/lvl_1_1.tscn")

func _ready():
	pass

func _process(delta):
	pass

func _on_lvl_1_pressed():
	get_tree().change_scene_to_packed(LVL_1_1)
