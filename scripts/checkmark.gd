extends Area2D

signal checkmark(location: Vector2)




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if !is_connected("checkmark", body._on_checkmark):
			connect("checkmark", body._on_checkmark)
		checkmark.emit($RespawnHere.global_position)
