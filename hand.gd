extends Node2D

@onready var Deck = get_node("res://deck.tscn")

var hand = []
var cardpath = "res://assets/Cards/"
var cardwidth
var card_widthsss
@export var cardscale = Vector2(1.5,1.5)
# Called when the node enters the scene tree for the first time.

func draw_cards(num):
	hand += Deck.give_cards(num)
	sprite_cards()
	place_cards()

func sprite_cards():
	var firstpart
	var secondpart
	var fullpart
	for i in hand.size():
		hand[i].cardscale = cardscale
		fullpart = ""
		if hand[i].cardsuit == "spade":
			firstpart = "Spades_"
		elif hand[i].cardsuit == "diamond":
			firstpart = "Diamonds_"
		elif hand[i].cardsuit == "club":
			firstpart = "Clubs_"
		elif hand[i].cardsuit == "heart":
			firstpart = "Hearts_"
		if hand[i].cardvalue == 1:
			secondpart = "Ace.png"
		elif hand[i].cardvalue == 11:
			secondpart = "Jack.png"
		elif hand[i].cardvalue == 12:
			secondpart = "Queen.png"
		elif hand[i].cardvalue == 13:
			secondpart = "King.png"
		else:
			secondpart = str(hand[i].cardvalue) + ".png"
		fullpart = firstpart + secondpart
		hand[i].change_sprite(cardpath+fullpart)
	var path_length = $Path2D.curve.get_baked_length()
	var space
	var ideal_cardwidth
	var hand_width

func place_cards():
	var path_length = $Path2D.curve.get_baked_length()
	var space
	var ideal_cardwidth
	var hand_width

	for i in hand.size():
#		card_widthsss = hand[0]
#		print(card_widthsss)
		cardwidth = hand[0].card_width()
#		cardwidth = 5
		ideal_cardwidth = cardwidth * 1.5
		hand_width = ideal_cardwidth * hand.size()
		add_child(hand[i])

		space = path_length
		$Path2D/PathFollow2D.offset = 0.0
		if hand_width < path_length:
			$Path2D/PathFollow2D.offset = (space - hand_width)/2

			print("ideal cardwidth space: " + str(ideal_cardwidth))
		else:
			ideal_cardwidth = space / hand.size()
			print("ideal cardwidth crowded: " + str(ideal_cardwidth))
		
		for card in hand.size():
			if !hand[card].dealt:
				hand[card].position = $DeckLocation.position
			hand[card].handposition = $Path2D/PathFollow2D/DeckSpawner.get_global_position()
			hand[card].handrotation = $Path2D/PathFollow2D/DeckSpawner.get_global_transform().get_rotation()
			hand[card].move_card(hand[card].handposition, hand[card].handrotation)
			hand[card].dealt = true

			$Path2D/PathFollow2D.offset += ideal_cardwidth
		$Path2D/PathFollow2D.offset = 0.0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
