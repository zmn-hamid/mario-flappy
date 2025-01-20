extends Area2D

@onready var game_manager: Node = %GameManager
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		game_manager.finished_mario()
		body.finished_mario()
		collision_shape.queue_free()
		video_stream_player.play()
