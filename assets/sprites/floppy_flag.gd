extends Area2D

@onready var game_manager: Node = %GameManager
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
@onready var video_stream_player_2: VideoStreamPlayer = $VideoStreamPlayer2

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		collision_shape.queue_free()
		video_stream_player.play()
		video_stream_player_2.play()
		
		body.finish_game()
