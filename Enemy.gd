extends Node2D
var MAX_HUNGER = 10	
var MAX_PATIENCE = 10
var DAMAGE=2
var Hunger:
	set(value):
		Hunger=value
		$HungerMeter.value=value
	get:
		return Hunger
		
var Patience:
	set(value):
		Patience=value
		$PatienceMeter.value=value
	get:
		return Patience


# Called when the node enters the scene tree for the first time.
func _ready():
	$HungerMeter.max_value=MAX_HUNGER
	$PatienceMeter.max_value=MAX_PATIENCE
	Hunger=0
	Patience=MAX_PATIENCE
	pass # Replace with function body.

func on_turn_change():
	Hunger+=2
	Patience-=2
	$/root/GameController.take_dmg(DAMAGE)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
