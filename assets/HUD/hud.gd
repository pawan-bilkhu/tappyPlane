extends Control
@onready var score_value = $MarginContainer/ScoreValue


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_score_updated.connect(display_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func display_score() -> void:
	score_value.text = str(GameManager.get_score())
