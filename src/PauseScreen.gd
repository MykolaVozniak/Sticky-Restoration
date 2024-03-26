extends Control

@onready var lvl_label = $LvlLabel
@onready var game_manager = %GameManager

const JOURNAL = preload("res://src/scenes/journal.tscn")
var current_lvl
var next_lvl
var lvl_menu

func _ready():
	var scene_root_node = get_tree().get_root().get_child(0)
	var scene_root_name: String = scene_root_node.name
	lvl_label.text = "[center][shake rate=10 level=10 connected=1]%s[/shake][/center]" % [scene_root_name]
	
	current_lvl = load(game_manager.current_lvl)
	next_lvl = load(game_manager.next_lvl)
	lvl_menu = load(game_manager.lvl_menu)

func _process(delta):
	pass


func _on_to_menu_button_pressed():
	print(lvl_menu)
	get_tree().change_scene_to_packed(lvl_menu)

func _on_retry_button_pressed():
	get_tree().change_scene_to_packed(current_lvl)

func _on_journal_button_pressed():
	var node = JOURNAL.instantiate()
	add_child(node)

func _on_next_button_pressed():
	get_tree().change_scene_to_packed(next_lvl)
