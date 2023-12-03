extends ParallaxBackground



# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(stop_scroll)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x += GameManager._get_scroll_speed()*delta*(-1)

func stop_scroll()->void:
	set_process(false)
