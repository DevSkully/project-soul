extends CanvasLayer

@onready var Player = $"../.."
@onready var Player_Stats = $"../../Stats"

@onready var PlayerHealthBar:ProgressBar = $HealthBar
@onready var PlayerManaBar:ProgressBar = $ManaBar
@onready var PlayerExperienceBar:ProgressBar = $ExperienceBar

## -- FUNCTIONS - READY -- ##
func _ready() -> void:
	Player_Stats.health_change.connect(Health_Update)
	Player_Stats.mana_change.connect(Mana_Update)
	Player.experience_change.connect(Experience_Update)
	
	PlayerHealthBar.max_value = Player_Stats.get_Health()
	PlayerManaBar.max_value = Player_Stats.get_Mana()
	PlayerExperienceBar.max_value = Player.maxExperience


## -- PROGRESS BAR - UPDATE --##
func Health_Update()->void:
	PlayerHealthBar.value = Player_Stats.get_Health()
func Mana_Update()->void:
	PlayerManaBar.value = Player_Stats.get_Mana()
func Experience_Update()->void:
	PlayerExperienceBar.value = Player.experience
func LevelUp()->void:
	PlayerExperienceBar.max_value = Player.maxExperience
	PlayerExperienceBar.value = 0
