extends Node2D

@onready var console = $Console
@onready var combat: CombatManager = $Combat as CombatManager

signal console_ready(ref)

var names = ["Ken", "Barby", "Roland", "Melissa"]

func _ready():
	console_ready.emit(console)
	Start()

func Start():
	console.clear()
	console.printLine("Welcome to RPG simulation!")
	var troll:Monster = Monster.new("Trolly", Dice.rollParse("4d20+103"), 10)
	#combat.SimulateBattle(names, "Troll", 50, 10)
	combat.Combat(troll)
