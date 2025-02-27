extends Node
#################
## - VARIABLE - ##
#################
# - SIGNAL - #
signal HealthBar(maxHealth)
signal ManaBar(maxMana)
signal ShieldBar(maxShield)
# - BASIC STATS - #
@export var Health : float
@export var Mana : float
@export var Shield : float
# - MAX SIGNAL - #
@export var maxHealth:float
@export var maxMana:float
@export var mxShield:float
# - MOVEMENT AND ATTACK - #
@export var attack_speed : float
@export var movement_speed : float
# - DAMAGE MLTIPLIER - #
@export var BaseDamage : float
@export var CritRate : float
@export var CritDamage : float

###################
## - FUNCTIONS - ##
###################
func _ready()->void:
	HealthBar.emit()
	ManaBar.emit()
	ShieldBar.emit()

func _recover(amount:float)->void:
	if Health != maxHealth:
		Health += amount

func _damageCalc(Resistance:float)->float:
	if (randf_range(0,100) == CritRate):
		return BaseDamage
	else:
		return BaseDamage+(BaseDamage*CritDamage)
