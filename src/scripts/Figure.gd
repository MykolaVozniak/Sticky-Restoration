extends CharacterBody2D

const TILE_SIZE: int = 8 #qq
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
	pass

func _physics_process(delta):
#To avoid the "rollback" effect when changing direction, 
#we change direction not relative to our current position, 
#but relative to the position we were heading for.
	if is_direction_changed:
		next_tile = next_tile.snapped(Vector2(TILE_SIZE, TILE_SIZE)) + current_direction * TILE_SIZE
		is_direction_changed = false
		is_direction_process = true
	elif is_direction_process:
		next_tile = next_tile
		if(position.snapped(Vector2(TILE_SIZE, TILE_SIZE)) == next_tile):
			is_direction_process = false
	else:
		next_tile = position.snapped(Vector2(TILE_SIZE, TILE_SIZE)) + current_direction * TILE_SIZE
	
	velocity = (next_tile - position).normalized() * speed
	move_and_slide()

func _input(_event):
	for dir in directions.keys():
		if Input.is_action_just_pressed(dir):
			current_direction = directions[dir]
			is_direction_changed = true
			
func speed_to_normal():
	speed = SPEED_NORMAL
	
func speed_to_slow():
	speed = SPEED_SLOW
