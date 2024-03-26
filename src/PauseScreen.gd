extends Control

@onready var lvl_label = $LvlLabel
@onready var game_manager = %GameManager

#var current_lvl = game_manager.current_lvl
#var next_lvl = game_manager.next_lvl
#var lvl_menu = game_manager.lvl_menu

func _ready():
	var scene_root_node = get_tree().get_root().get_child(0)
	var scene_root_name: String = scene_root_node.name
	lvl_label.text = "[center][shake rate=10 level=10 connected=1]%s[/shake][/center]" % [scene_root_name]

func _process(delta):
	pass


func _on_to_menu_button_pressed():
	print(game_manager.lvl_menu)
	get_tree().change_scene_to_packed(game_manager.lvl_menu)


#func _on_retry_button_pressed():
	#get_tree().change_scene_to_packed(game_manager.current_lvl)
#
#
#func _on_journal_button_pressed():
	#pass # Replace with function body.
#
#func _on_next_button_pressed():
	#get_tree().change_scene_to_packed(game_manager.next_lvl)
