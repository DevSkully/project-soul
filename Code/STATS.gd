extends Node2D

signal health_change
signal mana_change

@export var HealthPoints:int
@export var ManaPoints:int

@onready var Drop = preload("res://tscn/Object/Drop.tscn")

## ---FUNCTOINS--- ##
# GETTERS
func get_Health()->int:
	return HealthPoints
func get_Mana()->int:
	return ManaPoints
# SETTERS
func set_Health(HP:int)->void:
	self.HealthPoints = HP
func set_Mana(MP:int)->void:
	self.ManaPoints = MP

# HEALTH FUNCTINOS
func Heal(HP:int)->void:
	HealthPoints += HP
	health_change.emit()
func take_damage(damage:int)->void:
	HealthPoints -= damage
	health_change.emit()
# MANA FUNCTIONS
func recover(MP:int)->void:
	ManaPoints += MP
	mana_change.emit()

## -- PROCESS -- ##
func _process(delta: float) -> void:
	if HealthPoints <= 0 :
		get_parent().death()
