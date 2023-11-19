extends Node

@onready var Deck = $CardController/Deck
@onready var Player = $CardController/PlayerHand

var card = []

# Called when the node enters the scene tree for the first time.
func _ready():
#	Deck.give_cards(2)
#	print(card)
#	await(get_tree().create_timer(1.0),"timeout")
	await get_tree().create_timer(1).timeout
	get_tree().call_group("players", "draw_cards", 3)
	
	await get_tree().create_timer(1).timeout
	get_tree().call_group("players", "draw_cards", 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
