extends Node2D

@onready var Deck = get_node("Deck")

var hand = []
var cardpath = "res://assets/Cards/"
var cardwidth
var card_widthsss
var current_handsize
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
#		hand[i].cardscale = cardscale
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
#        card_widthsss = hand[0]
#        print(card_widthsss)
		cardwidth = hand[0].card_width()
#        cardwidth = 5
		ideal_cardwidth = cardwidth * 1.5
		hand_width = ideal_cardwidth * hand.size()
		add_child(hand[i])
		print("HELLO adding " + str(i))

		space = path_length
		$Path2D/PathFollow2D.progress = 0.0
		if hand_width < path_length:
			$Path2D/PathFollow2D.progress = (space - hand_width)/2

			print("ideal cardwidth space: " + str(ideal_cardwidth))
		else:
			ideal_cardwidth = space / hand.size()
			print("ideal cardwidth crowded: " + str(ideal_cardwidth))
			
			current_handsize = hand.size()
			print("this is your ")
			print(hand)
#		for card in current_handsize:

		if !hand[i].dealt:
			hand[i].position = $DeckPosition.position
		hand[i].handposition = $Path2D/PathFollow2D/DeckSpawner.get_global_position()
		hand[i].handrotation = $Path2D/PathFollow2D/DeckSpawner.get_global_transform().get_rotation()
		hand[i].move_card(hand[i].handposition, hand[i].handrotation)
		hand[i].dealt = true

		$Path2D/PathFollow2D.progress += ideal_cardwidth
		# $Path2D/PathFollow2D.progress = 0.0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
