extends Node2D

var card_scene = preload("res://scenes/Card.tscn")

#@onready var Deck = get_node("res://scenes/deck.tscn/Deck")
@onready var DeckScene = preload("res://scenes/deck.tscn")
@onready var card_positions = $Spawn_Positions
@onready var Deck = DeckScene.instantiate()

var hand = []
var cardpath = "res://assets/Cards/"
var cardwidth
var card_widthsss
var current_handsize
var cardscale = Vector2(1.5,1.5)


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(Deck)
	draw_cards(1)
	draw_cards(1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawn_cards()
func draw_cards(num):
	hand += Deck.give_cards(num)
	sprite_cards()
	spawn_cards()

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
#	var path_length = $Path2D.curve.get_baked_length()
	var space
	var ideal_cardwidth
	var hand_width
#func spawn_cards():
#	var card_instance = card_scene.instantiate()
#	card_instance.global_position = Vector2(406,647)
#	add_child(card_instance)
#	pass
func spawn_cards():
	var card_positions_array = card_positions.get_children()
	var random_card_position = card_positions_array.pick_random()
#	var card_instance = card_scene.instantiate()
#	card_instance.global_position = Vector2(406,647)
	for i in hand.size():
#		hand[i].global_position =  Vector2(406,647)
		hand[i].global_position =  random_card_position.global_position
		add_child(hand[i])
#	add_child(card_instance)
	pass
	
	

