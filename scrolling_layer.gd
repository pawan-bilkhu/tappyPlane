extends ParallaxLayer
@onready var sprite_2d = $Sprite2D

@export var texture: Texture
@export var scroll_scale: float = 0.0
@export var texture_dx: float = 1920
@export var texture_dy: float = 1080

# Called when the node enters the scene tree for the first time.
func _ready():
	motion_scale.x = scroll_scale
	
	var scale_factor = get_viewport_rect().size.y/texture_dy
	
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_factor, scale_factor)
	motion_mirroring.x = texture_dx * scale_factor 



