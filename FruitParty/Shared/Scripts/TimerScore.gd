extends Control

var timeScore = 120
var enable = true

func restore(time):
	timeScore += time
	update_time()

func _process(delta):
	if enable:
		$Timer.start()
		enable = false

func _on_timer_timeout():
	timeScore -= 1
	update_time()
	if timeScore == 0:
		get_tree().quit()
	enable = true

func update_time():
	$Label4.text = str(timeScore)
