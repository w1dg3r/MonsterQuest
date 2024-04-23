#extends Console
class_name GameState

var fightOngoing = true
var names = ["Ken", "Barby", "Roland", "Melissa"]
var	consoleRef: Node

func _init(consoleNode):
	consoleRef = consoleNode

func _start():
	var PartyNames = ", ".join(names)
	consoleRef.printLine("A party of warriors "+ PartyNames +" decends into the dungeon")

	_SimulateBattle(names,"Troll",50,10)


func _SimulateBattle(names, monster: String, monsterHP: int, savingThrowDC: int):
	print()
	consoleRef.printLine("A "+monster + " with "+ str(monsterHP) + " HP appears")
	print()
	
	while names.size() > 0:
		
		for name in names:
			var damage = randi_range(2, 6)
			monsterHP -= damage
		
			if monsterHP > 0:
				consoleRef.printLine(name + " hits the " + monster + " for " + str(damage) + " damage. " + monster + " has " + str(monsterHP) + " HP left.")
				print()
		
			elif monsterHP < 0:
				consoleRef.printLine(name + " hits the " + monster + " for " + str(damage) + " damage which kills it!!")
				print()
				break

		if monsterHP < 0:
			break
	
		var targetIndex = randi_range(1, names.size())
		var targetName = names[targetIndex-1]
		
		consoleRef.printLine("The " + monster + " attacks " + targetName + "!")
		print()

		var constitution = 5
		var saveRoll = randi_range(1, 20)
		
		if constitution + saveRoll > savingThrowDC:
			consoleRef.printLine(targetName + " rolls a " + str(saveRoll) + " and is saved from the attack.")
			
		else:
			consoleRef.printLine(targetName + " rolls a " + str(saveRoll) + " and died a painful death.")
			names.erase(targetName)

		print()
	
	if monsterHP > 0:
		consoleRef.printLine("Your party has died and the " + monster + " will ravish the lands!")
		
	else:
		var remainingNames = ", ".join(names)
		consoleRef.printLine("The " + monster + " collapses and " + remainingNames + " move on!")	
	





