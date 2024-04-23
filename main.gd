extends Node2D

@onready var console = $Console
@onready var gm = GameState.new(console)

func _ready():
	#Globals.print = console_print
	console.clear()
	#for n in 10:
	#	console.printLine(str($Dice.roll()))
	#	console.printLine(str($Dice.rolls))
	gm._start()
		

func _process(delta):
	pass


func console_print(message):
	console.printLine(message)
