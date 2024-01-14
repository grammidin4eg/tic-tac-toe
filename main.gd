extends Node2D

enum EPlayerType { CROSS = 1, ZERO = -1, EMPTY = 0 }
var currentPlayer: EPlayerType
@export var blocks: Array[Sprite2D]

func _ready():
	_new_game()

func _reverse_player_type():
	currentPlayer = EPlayerType.CROSS if currentPlayer == EPlayerType.ZERO else EPlayerType.ZERO

func _on_block_click(curBlock):
	# print(curBlock)
	if curBlock.is_empty():
		curBlock.set_value(currentPlayer)
		_reverse_player_type()
		_check_win()

func _check_win() -> bool:
	const checkArray = [
		[0, 1, 2],
		[3, 4, 5],
		[6, 7, 8],
		[0, 3, 6],
		[1, 4, 7],
		[2, 5, 8],
		[0, 4, 8],
		[2, 4 ,6]
	]
	for i in len(checkArray):
		var result = _check_line(checkArray[i])
		if result != EPlayerType.EMPTY:
			print("!!! win: ", result)
			_game_over(result)
	return false

func _check_line(row: Array) -> EPlayerType:
	var row_sum = 0
	for i in len(row):
		row_sum += _get_block_value(row[i])
	if row_sum == 3:
		return EPlayerType.CROSS
	elif row_sum == -3:
		return EPlayerType.ZERO
	return EPlayerType.EMPTY

func _get_block_value(index: int) -> EPlayerType:
	return blocks[index].get_value()

func _game_over(result: EPlayerType):
	get_tree().paused = true
	pass

func _new_game():
	currentPlayer = EPlayerType.CROSS
	get_tree().paused = false
	pass
