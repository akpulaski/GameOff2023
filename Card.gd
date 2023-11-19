extends Area2D

var cardname
var cardvalue
var cardsuit

@export var cardsprite : Texture

@export var cardscale: Vector2 = Vector2.ZERO :
	set (_scale):
		cardscale = change_cardscale(_scale)
	get:
		return cardscale

func change_sprite(res):
	$Sprite.texture = load(res)

func change_cardscale(_scale):
	scale = _scale
	pass
func card_width():
	var cardwidth = $Sprite.texture.get_width() * $Sprite.scale.x
	return cardwidth




# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().create_tween().bind_node(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
