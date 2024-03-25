extends CharacterBody2D

@onready var game_manager = %GameManager
var tile_size: int

const SPEED_NORMAL: float = 300
const SPEED_SLOW: float = 70
var speed: float = SPEED_NORMAL

var directions = {
	"up": Vector2.UP,
	"down": Vector2.DOWN,
	"left": Vector2.LEFT,
	"right": Vector2.RIGHT
}

var current_direction: Vector2 = Vector2.ZERO

var is_direction_changed = false
var is_direction_process = false
var next_tile

func _ready():
	tile_size = game_manager.TILE_SIZE
	current_direction = _get_random_direction()

func _physics_process(_delta):
	if game_manager.current_state == game_manager.GameState.RUNNING:
	#To avoid the "rollback" effect when changing direction, 
	#we change direction not relative to our current position, 
	#but relative to the position we were heading for.
		if is_direction_changed:
			next_tile = next_tile.snapped(Vector2(tile_size, tile_size)) + current_direction * tile_size
			is_direction_changed = false
			is_direction_process = true
		elif is_direction_process:
			next_tile = next_tile
			if(position.snapped(Vector2(tile_size, tile_size)) == next_tile):
				is_direction_process = false
		else:
			next_tile = position.snapped(Vector2(tile_size, tile_size)) + current_direction * tile_size
		
		velocity = (next_tile - position).normalized() * speed
		move_and_slide()

func _input(_event):
	if game_manager.current_state == game_manager.GameState.RUNNING:
		for dir in directions.keys():
			if Input.is_action_just_pressed(dir):
				current_direction = directions[dir]
				is_direction_changed = true
			
func speed_to_normal():
	speed = SPEED_NORMAL
	
func speed_to_slow():
	speed = SPEED_SLOW
	
func _get_random_direction():
	var direction_keys = directions.keys()
	var random_index = randi() % direction_keys.size()
	var random_direction_key = direction_keys[random_index]
	var random_direction = directions[random_direction_key]
	return random_direction

