extends Control
@onready var lvl_label = $TextureRect/LvlLabel

const JOURNAL_SCREEN = preload("res://src/scenes/screens/journal_screen.tscn")
const SETTINGS_SCREEN = preload("res://src/scenes/screens/settings_screen.tscn")

func _ready():
	var scene_root_node = get_tree().get_root().get_child(0)
	var scene_root_name: String = scene_root_node.name
	lvl_label.text = "[center][shake rate=10 level=10 connected=1]%s[/shake][/center]" % [scene_root_name]

func _on_to_menu_button_pressed():
	pass

func _on_retry_button_pressed():
	get_tree().reload_current_scene()

func _on_journal_button_pressed():
	var node = JOURNAL_SCREEN.instantiate()
	add_child(node)

func _on_settings_button_pressed():
	var node = SETTINGS_SCREEN.instantiate()
	add_child(node)
