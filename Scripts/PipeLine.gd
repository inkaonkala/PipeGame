extends Node2D

enum PipeType {
	STRAIGHT,
	CORNER,
	TEE,
	CROSS
}

@export var pipe_type: PipeType = PipeType.STRAIGHT

@onready var sprite: Sprite2D = $Sprite2D

var grid_pos: Vector2i

const CELL_SIZE = 32

func _ready() -> void:
	sprite.position = Vector2(CELL_SIZE / 2.0, CELL_SIZE / 2.0)
	
func setup(type: PipeType, pos: Vector2i) -> void:
	pipe_type = type
	grid_pos = pos
	
	position = Vector2(
		grid_pos.x * 32,
		grid_pos.y * 32
	)
	
	update_sprite()

func update_sprite() -> void:
	match pipe_type:
		PipeType.STRAIGHT:
			sprite.region_rect = Rect2(0, 0, 32, 32)
		PipeType.TEE:
			sprite.region_rect = Rect2(32, 0, 32, 32)
		PipeType.CORNER:
			sprite.region_rect = Rect2(64, 0, 32, 32)
		PipeType.CROSS:
			sprite.region_rect = Rect2(0, 32, 32, 32)
			

func rotate_pipe() -> void:
	sprite.rotation_degrees += 90
	
