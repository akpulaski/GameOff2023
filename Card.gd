extends Area2D

var cardname
var cardvalue
var cardsuit
var dealt = false
#var tween_node

#@onready var tween_node : Tween = Tween.new()
var tween_node

#@onready var tweeeeen = get_tree().create_tween().bind_node(self)
#@onready var tweeeeen = get_tree().create_tween()


@export var cardsprite : Texture

@export var cardscale = Vector2()

#@export var cardscale:_scale = _scale :
#	set (_scale):
#		cardscale = change_cardscale(_scale)
#	get:
#		return cardscale
#@export var cardscale :Vector2 = Vector2.ZERO:
#	set (_scale):
#		cardscale = change_cardscale(_scale)
#	get:
#		return cardscale
var handposition = Vector2.ZERO
var handrotation = Vector2.ZERO

func move_card(dest, rotate = null, _scale = null):
		tween_node =get_tree().create_tween()
		print(get_tree())
		print(tween_node)
#		$Tween.interpolate_property(self, "position" , position, dest, 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
#		if (tween_node.is_active() == false):
#		var tween: Tween = create_tween()
		tween_node.tween_property(self, "position" , position, 0.5)
		if rotate != null:
#			$Tween.interpolate_property(self, "rotation", rotation, rotate, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN)
			tween_node.tween_property(self, "rotation", rotation, 0.2)
		if _scale != null:
#			$Tween.interpolate_property(self, "scale", scale, _scale, 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
			tween_node.tween_property(self, "scale", scale, 0.5)
		tween_node.play()
#		$Tween.start()
#		tween_node.start()
#		tween_node.tween_property()



func change_sprite(res):
	$Sprite2D.texture = load(res)
#	$Sprite.texture = load(res)

func change_cardscale(_scale):
	scale = _scale
	pass
func card_width():
	var cardwidth = $Sprite2D.texture.get_width() * $Sprite2D.scale.x
	return cardwidth
func kill_card():
	queue_free()




# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	tween_node =get_tree().create_tween()
#	get_tree().create_tween().bind_node(self)
#	var tween_node = get_tree().create_tween().bind_node(self)
#	tween_node = Tween.new()
##	tween_node.name = "Instanced_Tween"
#	add_child(tween_node)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
