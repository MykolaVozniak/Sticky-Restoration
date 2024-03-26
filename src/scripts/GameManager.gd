extends Node2D

@onready var text_message = $TextMessage
@onready var sl_animation_player = $ShadeLayer/SLAnimationPlayer
@onready var tm_animation_player = $TextMessage/TMAnimationPlayer
@onready var pb_animation_player = $PauseButton/PBAnimationPlayer

@export_category("Navigation Paths")
@export var lvl_menu: String
@export var current_lvl: String
@export var next_lvl: String

const TILE_SIZE: int = 8

enum GameState {
	START,
	RUNNING,
	PAUSED,
	WIN,
	LOSE,
	NOTHING
}

var stop_game_state = GameState.NOTHING
var current_state = GameState.START

func _process(delta):
	match current_state:
		GameState.START:
			handle_start_state()
		GameState.RUNNING:
			handle_running_state(delta)
		GameState.PAUSED:
			handle_paused_state()
		GameState.WIN:
			handle_win_state()
		GameState.LOSE:
			handle_lose_state()
		GameState.NOTHING:
			pass

func handle_start_state():
	set_state(GameState.NOTHING)
	
	sl_animation_player.play("shade_layer_fade_out_4s")
	
	text_message.text = "[center][shake rate=40.0 level=10 connected=1]3[/shake][/center]"
	tm_animation_player.play("text_message_play")
	await tm_animation_player.animation_finished
	
	text_message.text = "[center][shake rate=40.0 level=10 connected=1]2[/shake][/center]"
	tm_animation_player.play("text_message_play")
	await tm_animation_player.animation_finished
	
	text_message.text = "[center][shake rate=40.0 level=10 connected=1]1[/shake][/center]"
	tm_animation_player.play("text_message_play")
	await tm_animation_player.animation_finished
	
	text_message.text = "[center][shake rate=40.0 level=10 connected=1]Let's Go![/shake][/center]"
	tm_animation_player.play("text_message_play")
	await tm_animation_player.animation_finished
	
	await get_tree().create_timer(0.05).timeout
	set_state(GameState.RUNNING)

func handle_paused_state():
	set_stop_game_state(GameState.PAUSED)
	stop_game()

func handle_win_state():
	# Логіка перемоги (показ меню статистики, перехід до меню тощо)
	set_stop_game_state(GameState.WIN)
	stop_game()

func handle_lose_state():
	# Логіка програшу (показ меню статистики, перехід до меню тощо)
	set_stop_game_state(GameState.LOSE)
	stop_game()

func stop_game():
	set_state(GameState.NOTHING)
	sl_animation_player.play("shade_layer_fade_in_instant")
	pb_animation_player.play("pause_button_to_blue")
	match stop_game_state:
		GameState.PAUSED:
			print("game paused")
		GameState.WIN:
			print("game win")
		GameState.LOSE:
			print("game lose")
		GameState.NOTHING:
			print("game nothing")
	
func resume_game(): #call from menu!
	set_state(GameState.RUNNING)
	set_stop_game_state(GameState.NOTHING)
	sl_animation_player.play("shade_layer_fade_out_instant")
	pb_animation_player.play("pause_button_to_environment")
	print("game running")
	
func _input(_event):
	if Input.is_action_just_pressed("escape") && current_state == GameState.RUNNING:
		set_state(GameState.PAUSED)
	elif Input.is_action_just_pressed("escape") && stop_game_state == GameState.PAUSED:
		resume_game()


func _on_pause_button_pressed():
	if current_state == GameState.RUNNING:
		set_state(GameState.PAUSED)
	elif stop_game_state == GameState.PAUSED:
		resume_game()

func handle_running_state(delta):
	# Логіка ігрового процесу
	print("running")
	
func set_state(new_state):
	current_state = new_state
	
func set_stop_game_state(new_state):
	stop_game_state = new_state
