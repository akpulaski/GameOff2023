extends Node2D

@onready var Deck = get_node("res://deck.tscn")

var hand = []
var cardpath = "res://assets/Cards/"
var cardwidth
@export var cardscale = Vector2(1.5,1.5)
# Called when the node enters the scene tree for the first time.

func draw_cards(num):
	hand += Deck.give_cards(num)
	sprite_cards()
	place_cards()

func sprite_cards():
	pass
func place_cards():
	pass
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
