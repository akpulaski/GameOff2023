extends Node2D
@onready var UI = $UI
enum TURNSTATES{
	PLAYER,
	ENEMY
}
var turnState:
	set(value):
		turnState=value
		match value:
			#if it becomes player turn, call functions/stuff doable on player turn
			TURNSTATES.PLAYER:
				print("PLAYER TURN START")
				pass
			#on enemy turn, call functions/stuff
			TURNSTATES.ENEMY:
				spawnEnemy(1,0)
				#find way to call the on_turn_change of every active enemy
				print("ENEMY TURN START")
				pass
	get:
		return turnState
				
var PlayerHP:
	set(value):
		PlayerHP = value
		UI.get_node("HealthBar").value=PlayerHP
		UI.get_node("HealthBar/L1").text= str(PlayerHP) + "/" + str(MAX_PLAYER_HP)
	get:
		return PlayerHP
		
		
			
var MAX_PLAYER_HP:int = 50
func take_dmg(dmg):
	PlayerHP-=dmg
	
func _changeTurn():
	match turnState:
		TURNSTATES.PLAYER:
			turnState=TURNSTATES.ENEMY
			
		TURNSTATES.ENEMY:
			turnState=TURNSTATES.PLAYER
# Called when the node enters the scene tree for the first time.
func spawnEnemy(amount,_type):
	for i in amount:
		var enemy = load("res://enemy.tscn").instantiate()
		add_child(enemy)
		enemy.position = Vector2(randi_range(300,500),randi_range(300,500))
func _ready():
	$UI.get_node("HealthBar").max_value=MAX_PLAYER_HP
	PlayerHP = MAX_PLAYER_HP
	turnState = TURNSTATES.PLAYER
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	_changeTurn()
	pass # Replace with function body.
