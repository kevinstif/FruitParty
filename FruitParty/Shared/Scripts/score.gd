extends CanvasLayer

@onready var fruitsScoreControl = $FruitsScore
@onready var heartsScoreControl = $HeartsScore
@onready var timerScoreConrol = $TimerScore

func update_fruits_score(fruitsNumber):
	fruitsScoreControl.update(fruitsNumber)

func update_healt_score(healthNumber):
	heartsScoreControl.update(healthNumber)

func restore_timer(time):
	timerScoreConrol.restore(time)
