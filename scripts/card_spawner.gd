extends Node2D

var card_scene = preload("res://scenes/Card.tscn")

#@onready var Deck = get_node("res://scenes/deck.tscn/Deck")
@onready var DeckScene = preload("res://scenes/deck.tscn")
@onready var card_positions = $Spawn_Positions
@onready var prepare_positions = $Prepare_Positions
@onready var Deck = DeckScene.instantiate()

var hand = []
var cardpath = "res://assets/Cards/"
var cardwidth
var card_widthsss
var current_handsize
var cardscale = Vector2(1.5,1.5)
var current_hand_positions_andcards = {}
var current_pos
var prep_item
var prep_item_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(Deck)
#	draw_cards(1)
#	draw_cards(1)
#	draw_cards(1)
#	draw_cards(1)
#	draw_cards(1)
#	draw_cards(1)
#	draw_cards(7)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("prep1"):
		prep_item = 1
		prepare_meal(prep_item)
	if Input.is_action_just_pressed("prep2"):
		prep_item = 2
		prepare_meal(prep_item)
	if Input.is_action_just_pressed("prep3"):
		prep_item = 3
		prepare_meal(prep_item)
	if Input.is_action_just_pressed("prep4"):
		prep_item = 4
		prepare_meal(prep_item)
	if Input.is_action_just_pressed("prep5"):
		prep_item = 5
		prepare_meal(prep_item)
	if Input.is_action_just_pressed("prep6"):
		prep_item = 6
		prepare_meal(prep_item)
	if Input.is_action_just_pressed("prep7"):
		prep_item = 7
		prepare_meal(prep_item)
	if Input.is_action_just_pressed("serve"):
		serve()
	if prep_item_count >= 3:
		$MustCookLabel.text = "Must serve items"
func prepare_meal(prep_item):
	if prep_item == 1 and prep_item_count <3:
		var food_prep_array = prepare_positions.get_children()
		var random_prep_pos = food_prep_array.pick_random()
		for each in hand:
			var nametosearch = each.cardname
			if nametosearch in  current_hand_positions_andcards and current_hand_positions_andcards[nametosearch] == 407:
				remove_child(each)
				each.global_position =  random_prep_pos.global_position
				add_child(each)
				prep_item_count += 1
			else:
				print("some message idk what else")
	if prep_item == 2 and prep_item_count <3:
		var food_prep_array = prepare_positions.get_children()
		var random_prep_pos = food_prep_array.pick_random()
		for each in hand:
			var nametosearch = each.cardname
			if nametosearch in  current_hand_positions_andcards and current_hand_positions_andcards[nametosearch] == 497:
				remove_child(each)
				each.global_position =  random_prep_pos.global_position
				add_child(each)
				prep_item_count += 1
			else:
				print("some message idk what else")
	if prep_item == 3 and prep_item_count <3:
		var food_prep_array = prepare_positions.get_children()
		var random_prep_pos = food_prep_array.pick_random()
		for each in hand:
			var nametosearch = each.cardname
			if nametosearch in  current_hand_positions_andcards and current_hand_positions_andcards[nametosearch] == 578:
				remove_child(each)
				each.global_position =  random_prep_pos.global_position
				add_child(each)
				prep_item_count += 1
			else:
				print("some message idk what else")
	if prep_item == 4 and prep_item_count <3:
		var food_prep_array = prepare_positions.get_children()
		var random_prep_pos = food_prep_array.pick_random()
		for each in hand:
			var nametosearch = each.cardname
			if nametosearch in  current_hand_positions_andcards and current_hand_positions_andcards[nametosearch] == 677:
				remove_child(each)
				each.global_position =  random_prep_pos.global_position
				add_child(each)
				prep_item_count += 1
			else:
				print("some message idk what else")
	if prep_item == 5 and prep_item_count <3:
		var food_prep_array = prepare_positions.get_children()
		var random_prep_pos = food_prep_array.pick_random()
		for each in hand:
			var nametosearch = each.cardname
			if nametosearch in  current_hand_positions_andcards and current_hand_positions_andcards[nametosearch] == 767:
				remove_child(each)
				each.global_position =  random_prep_pos.global_position
				add_child(each)
				prep_item_count += 1
			else:
				print("some message idk what else")
	if prep_item == 6 and prep_item_count <3:
		var food_prep_array = prepare_positions.get_children()
		var random_prep_pos = food_prep_array.pick_random()
		for each in hand:
			var nametosearch = each.cardname
			if nametosearch in  current_hand_positions_andcards and current_hand_positions_andcards[nametosearch] == 857:
				remove_child(each)
				each.global_position =  random_prep_pos.global_position
				add_child(each)
				prep_item_count += 1
			else:
				print("some message idk what else")
	if prep_item == 7 and prep_item_count <3:
		var food_prep_array = prepare_positions.get_children()
		var random_prep_pos = food_prep_array.pick_random()
		for each in hand:
			var nametosearch = each.cardname
			if nametosearch in  current_hand_positions_andcards and current_hand_positions_andcards[nametosearch] == 947:
				remove_child(each)
				each.global_position =  random_prep_pos.global_position
				add_child(each)
				prep_item_count += 1
			else:
				print("some message idk what else")
func serve():
	print("meal is served")
	### This function will be used to attack the monsters, it will be a spacebar action
	pass
#	var rocket_instance = rocket_scene.instantiate()
#	rocket_container.add_child(rocket_instance)
#	rocket_instance.global_position = global_position
#	rocket_instance.global_position.x += 80


func _on_timer_timeout():
	spawn_cards()
func draw_cards(num):
	hand += Deck.give_cards(num)
#	for each in hand:
#		sprite_cards()
#		spawn_cards()
#	sprite_cards()
#	spawn_cards()
	for each in hand:
		sprite_cards()
		spawn_current_card(each)

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
		hand[i].global_position =  random_card_position.global_position
		add_child(hand[i])
		current_pos = hand[i].global_position
		current_hand_positions_andcards[hand[i]] = hand[i].global_position
		for item in current_hand_positions_andcards:
			if item[i] == current_pos:
				current_hand_positions_andcards.erase(item)
				hand[i].global_position =  random_card_position.global_position
				add_child(hand[i])
				current_pos = hand[i].global_position
				current_hand_positions_andcards[hand[i]] = hand[i].global_position
				
#		points_dict["Blue"] = 150 
#	add_child(card_instance)
	pass
func spawn_current_card(single_card):
	var card_positions_array = card_positions.get_children()
	var random_card_position = card_positions_array.pick_random()
	single_card.global_position =  random_card_position.global_position
	add_child(single_card)
	var name_toadd = single_card.cardname
	var pos_toadd_x = single_card.global_position.x
	current_hand_positions_andcards[name_toadd] = pos_toadd_x
	print("this is an example card")
	print(single_card)
#	add_child(card_instance)
	pass

	






func _on_stock_kitchen_button_pressed():
	draw_cards(7)
	pass # Replace with function body.
