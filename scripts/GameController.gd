extends Node2D
@onready var UI = $UI
enum TURNSTATES{
	PLAYER,
	ENEMY
}
var MAX_ENEMIES = 3
var enemyAmount = 0
var enemypositions = []
var possiblePositions = [Vector2(500,540),Vector2(700,540),Vector2(900,540)]
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
				get_tree().call_group("enemies","on_turn_change")
				spawnEnemy(1,0)
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
		if enemyAmount<MAX_ENEMIES:
			enemyAmount+=1
			var enemy = load("res://scenes/enemy.tscn").instantiate()
			add_child(enemy)
			print(enemyAmount)
			for j in MAX_ENEMIES:
				if not enemypositions[j].occupied:
					enemy.position = enemypositions[j].coords
					enemypositions[j].occupied = true
					break
					
func _ready():
	$UI.get_node("HealthBar").max_value=MAX_PLAYER_HP
	PlayerHP = MAX_PLAYER_HP
	turnState = TURNSTATES.PLAYER
	for i in MAX_ENEMIES:
		enemypositions.append(EnemyPos.new()) 
		enemypositions[i].coords=possiblePositions[i]
		print(enemypositions[i].coords)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	_changeTurn()
	pass # Replace with function body.
