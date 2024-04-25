extends Node
class_name CombatManager

var console
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$"..".connect("console_ready", _onConsoleReady)
	
func _onConsoleReady(ref):
	console = ref
	console.printLine("CombatManager ready")
	
func Combat(monster: Monster):
	SimulateBattle($"..".names, monster.displayName, monster.hitPoints, monster.savingThrowDC)

func SimulateBattle(names, monster: String, monsterHP: int, savingThrowDC: int) -> void:
	var fixedNames = stringHelper.joinWithAnd(names)
	console.printLine("A party of warriors "+ str(fixedNames) +" decends into the dungeon")
	
	console.printLine("A "+monster + " with "+ str(monsterHP) + " HP appears")
	
	while names.size() > 0:
		
		for name in names:
			var damage = Dice.rollWithDice(1,5,1)
			monsterHP -= damage
		
			if monsterHP > 0:
				console.printLine(name + " hits the " + monster + " for " + str(damage) + " damage. " + monster + " has " + str(monsterHP) + " HP left.")
		
			elif monsterHP < 0:
				console.printLine(name + " hits the " + monster + " for " + str(damage) + " damage which kills it!!")
				break

		if monsterHP < 0:
			break
	
		var targetIndex = Dice.rollWithDice(1,names.size(),0)
		var targetName = names[targetIndex-1]
		
		console.printLine("The " + monster + " attacks " + targetName + "!")

		var constitution = 5
		var saveRoll = Dice.rollWithDice(1,20,0)
		
		if constitution + saveRoll > savingThrowDC:
			console.printLine(targetName + " rolls a " + str(saveRoll) + " and is saved from the attack.")
			
		else:
			console.printLine(targetName + " rolls a " + str(saveRoll) + " and died a painful death.")
			names.erase(targetName)

	if monsterHP > 0:
		console.printLine("Your party has died and the " + monster + " will ravish the lands!")
		
	else:
		var remainingNames = stringHelper.joinWithAnd(names)
		console.printLine("The " + monster + " collapses and " + remainingNames + " move on!")	
	


