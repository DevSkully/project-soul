extends Node2D

@export var HealthPoints:int = 100
@export var ManaPoints:int = 100

@onready var Drop = preload("res://tscn/Object/Drop.tscn")

## ---FUNCTOINS--- ##
# GETTERS
func get_Health()->int:
	return HealthPoints
func get_Mana()->int:
	return ManaPoints
# SETTERS
func set_Health(HP:int)->void:
	HealthPoints = HP
func set_Mana(MP:int)->void:
	ManaPoints = MP

# HEALTH FUNCTINOS
func Heal(HP:int)->void:
	HealthPoints += HP
func take_damage(damage:int)->void:
	HealthPoints -= damage
# MANA FUNCTIONS
func recover(MP:int)->void:
	ManaPoints += MP

## -- PROCESS -- ##
func _process(delta: float) -> void:
	if HealthPoints <= 0 :
		get_parent().death()
