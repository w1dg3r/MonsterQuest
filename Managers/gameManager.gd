extends Node2D

@onready var console = $Console
#onready var gs = GameState.new()
@onready var cm = CombatManager.new(console)

func _ready():
	var names = ["Ken", "Barby", "Roland", "Melissa"]
	console.clear()
	#	console.printLine(str($Dice.roll()))
	#	console.printLine(str($Dice.rolls))
	#gs._start()
	cm.SimulateBattle(names,"Troll",50,10)

func _process(delta):
	pass
