extends Sprite2D

enum EPlayerType { CROSS = 1, ZERO = -1, EMPTY = 0 }
var value = EPlayerType.EMPTY

signal OnBlockClick(curBlock)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			# print("click", self)
			OnBlockClick.emit(self)

func set_value(new_value: EPlayerType):
	value = new_value
	if new_value != EPlayerType.EMPTY:
		const CROSS_IMG = preload("res://images/tac.png")
		const ZERO_IMG = preload("res://images/toe.png")
		var newTexture = CROSS_IMG if new_value == EPlayerType.CROSS else ZERO_IMG
		texture = newTexture
	else:
		const EMPTY_IMG = preload("res://images/empty.png")
		texture = EMPTY_IMG
	
func get_value():
	return value

func is_empty() -> bool:
	return value == EPlayerType.EMPTY
