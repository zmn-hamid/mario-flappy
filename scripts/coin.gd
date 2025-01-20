extends Area2D

signal collected_coin(coin_position: Vector2)

@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if !is_connected("collected_coin", body._on_coin_collected_coin):
			connect("collected_coin", body._on_coin_collected_coin)
		collected_coin.emit(global_position)
		animation_player.play("pickup")
