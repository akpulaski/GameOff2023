extends Node

@onready var Deck = $CardController/Deck

var card = []

# Called when the node enters the scene tree for the first time.
func _ready():
	Deck.give_cards(2)
	print(card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
