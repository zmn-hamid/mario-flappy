extends Area2D

@export var death_timer_duration: float = 0.2

signal user_died
signal user_respawned

@onready var hurt_sound: AudioStreamPlayer2D = $HurtSound


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		if !is_connected("user_died", body._on_killzone_user_died):
			connect("user_died", body._on_killzone_user_died)
		if !is_connected("user_respawned", body._on_killzone_user_respawned):
			connect("user_respawned", body._on_killzone_user_respawned)
		Engine.time_scale = 0.5
		hurt_sound.play()
		user_died.emit()
		await get_tree().create_timer(death_timer_duration).timeout
		Engine.time_scale = 1.0
		user_respawned.emit()
