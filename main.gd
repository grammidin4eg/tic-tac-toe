extends Node2D

enum EPlayerType { CROSS = 1, ZERO = -1, EMPTY = 0 }
var currentPlayer: EPlayerType
@export var blocks: Array[Sprite2D]

func _ready():
	currentPlayer = EPlayerType.CROSS

func _reverse_player_type():
	currentPlayer = EPlayerType.CROSS if currentPlayer == EPlayerType.ZERO else EPlayerType.ZERO

func _on_block_click(curBlock):
	# print(curBlock)
	if curBlock.is_empty():
		curBlock.set_value(currentPlayer)
		_reverse_player_type()

func _check_win() -> bool:
	return false
