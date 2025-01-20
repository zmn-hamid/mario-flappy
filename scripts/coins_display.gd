extends CanvasLayer

func ChangeText(score: String):
	%ScoreViewer.text = "Score: " + score

func _on_player_update_score_ui(score: int) -> void:
	ChangeText(str(score))


func _on_killzonemario_user_died() -> void:
	%laugh.play()
	await get_tree().create_timer(1).timeout
	%laugh.stop()
