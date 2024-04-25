class_name Monster extends CharacterBody2D

@export var displayName: String
@export var hitPoints: int
@export var savingThrowDC: int

func _init(dn: String, hp: int, savthr: int) -> void:
	displayName = dn
	hitPoints = hp
	savingThrowDC = savthr
	
func take_damage(damage_amount: int):
	hitPoints = clamp(hitPoints, 0, hitPoints-damage_amount)
	
