extends CanvasGroup
class_name UI
@onready var life_label = $MarginContainer/HBoxContainer/LifesLabel
@onready var game_lost_container = $GameOverContainer
@onready var Score_label = $MarginContainer/HBoxContainer/ScoreLabel

var score = 0

func _ready():
	game_lost_container.hide()

func add_score():
	
	score += 1
	$MarginContainer/HBoxContainer/ScoreLabel.text = "Score: " + str(score)
	
func set_lifes(lifes: int):
	print("Lifes changed to: ", lifes)
	life_label.text = "Lifes: %d" % lifes
	
	if lifes == 0:
		print("GAME OVER TRIGGERED!")
		game_over()

func game_over():
	game_lost_container.show()

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()
