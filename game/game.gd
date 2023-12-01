extends Node2D

@export var pipes_scene: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_upper = $SpawnUpper
@onready var spawn_lower = $SpawnLower
@onready var spawn_timer = $SpawnTimer
@onready var engine_sound = $EngineSound
@onready var game_over_sound = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)
	GameManager.set_score(0)
	spawn_pipes()

func _stop_pipes()-> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)
	


func spawn_pipes() -> void:
	var position_y = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	var new_pipes = pipes_scene.instantiate()
	new_pipes.position = Vector2(spawn_lower.position.x, position_y)
	pipes_holder.add_child(new_pipes)

func _on_spawn_timer_timeout():
	spawn_pipes()
	


func on_game_over():
	_stop_pipes()
	engine_sound.stop()
	game_over_sound.play()
