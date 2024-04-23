#extends Console
class_name GameState

var fightOngoing = true
var names = ["Ken", "Barby", "Roland", "Melissa"]
var	consoleRef: Node

func _init(consoleNode):
	consoleRef = consoleNode

func _start():
	var fixedNames = stringHelper.joinWithAnd(names)
	consoleRef.printLine("A party of warriors "+ str(fixedNames) +" decends into the dungeon")
	_SimulateBattle(names,"Troll",50,10)


func _SimulateBattle(names, monster: String, monsterHP: int, savingThrowDC: int):
	consoleRef.printLine("A "+monster + " with "+ str(monsterHP) + " HP appears")
	
	while names.size() > 0:
		
		for name in names:
			var damage = Dice.rollWithDice(1,5,1)
			monsterHP -= damage
		
			if monsterHP > 0:
				consoleRef.printLine(name + " hits the " + monster + " for " + str(damage) + " damage. " + monster + " has " + str(monsterHP) + " HP left.")
		
			elif monsterHP < 0:
				consoleRef.printLine(name + " hits the " + monster + " for " + str(damage) + " damage which kills it!!")
				break

		if monsterHP < 0:
			break
	
		var targetIndex = Dice.rollWithDice(1,names.size(),0)
		var targetName = names[targetIndex-1]
		
		consoleRef.printLine("The " + monster + " attacks " + targetName + "!")

		var constitution = 5
		var saveRoll = Dice.rollWithDice(1,20,0)
		
		if constitution + saveRoll > savingThrowDC:
			consoleRef.printLine(targetName + " rolls a " + str(saveRoll) + " and is saved from the attack.")
			
		else:
			consoleRef.printLine(targetName + " rolls a " + str(saveRoll) + " and died a painful death.")
			names.erase(targetName)

	if monsterHP > 0:
		consoleRef.printLine("Your party has died and the " + monster + " will ravish the lands!")
		
	else:
		var remainingNames = stringHelper.joinWithAnd(names)
		consoleRef.printLine("The " + monster + " collapses and " + remainingNames + " move on!")	
	





