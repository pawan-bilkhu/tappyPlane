extends Node

signal on_game_over
signal on_score_updated


const GROUP_PLANE: String = "plane"

var game_scene: PackedScene = preload("res://game/game.tscn")
var main_scene: PackedScene = preload("res://main/main.tscn")

var _score: int = 0
var _high_score: int = 0
var _scroll_speed: float = 150
var _pipe_spawn_interval: float = 1.5

func _set_pipe_spawn_interval(time_sec: float)->void:
	var minimum_interval: float = 0.75
	if _pipe_spawn_interval < minimum_interval:
		_pipe_spawn_interval = minimum_interval
	else:
		_pipe_spawn_interval = time_sec
	print("%f" % _pipe_spawn_interval)

func _get_pipe_spawn_interval()->float:
	return _pipe_spawn_interval

func _get_scroll_speed()-> float:
	return _scroll_speed

func _set_scroll_speed(speed_amount: float)-> void:
	_scroll_speed = speed_amount
	

func get_score() -> int:
	return _score
	
func get_high_score() -> int:
	return _high_score

func set_score(value: int) -> void:
	_score = value
	if _score > _high_score:
		_high_score = _score
	on_score_updated.emit()
	
	
	# print("score: %s, highscore: %s" % [_score, _high_score])

func increment_score() -> void:
	set_score(_score+1)
	if not _score%2:
		_set_scroll_speed(_scroll_speed+25)
		_set_pipe_spawn_interval(_pipe_spawn_interval-0.1)

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)
