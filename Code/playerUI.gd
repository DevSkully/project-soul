extends CanvasLayer

@onready var Player = $"../.."
@onready var Player_Stats = $"../../Stats"
@onready var PlayerHealthBar:ProgressBar = $HealthBar
@onready var PlayerManaBar:ProgressBar = $ManaBar
@onready var PlayerExperienceBar:ProgressBar = $ExperienceBar
@onready var Level:Label = $Level

## -- FUNCTIONS - SETTER NODE.STATS -- ##
func sudo_ready()->void:
	Player_Stats.health_change.connect(Health_Update)
	Player_Stats.mana_change.connect(Mana_Update)
	Player.experience_change.connect(Experience_Update)
	Player.level_up.connect(LevelUp)
	
	PlayerHealthBar.value = Player_Stats.HealthPoints
	PlayerManaBar.value = Player_Stats.ManaPoints

## -- PROGRESS BAR - UPDATE --##
func Health_Update()->void:
	PlayerHealthBar.value = Player_Stats.get_Health()
func Mana_Update()->void:
	PlayerManaBar.value = Player_Stats.get_Mana()
func Experience_Update()->void:
	PlayerExperienceBar.value = Player.experience
func LevelUp()->void:
	Level.text = str(Player.Level)
	PlayerExperienceBar.max_value = Player.maxExperience
	PlayerExperienceBar.value = 0
