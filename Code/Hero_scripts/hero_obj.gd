extends CharacterBody2D

## -- STATS / SCRIPT NODES-- ##
@onready var stats = $Scripts/Stats
@onready var movement = $Scripts/Movement
@onready var initialize = $Scripts/Initialize  # HERO HANDLER
## -- PROGRESS BARS -- ##
@onready var HealthBar : TextureProgressBar = $Control/Health_Bar
@onready var ManaBar   : TextureProgressBar = $Control/Mana_Bar
@onready var Exp_Bar   : TextureProgressBar = $Control/Experience_Bar
## -- HERO ASSETS -- ##



###################
## - FUNCTIONS - ##
###################
func _physics_process(delta: float) -> void:
	velocity = movement.get_Input() * stats.movement_speed
