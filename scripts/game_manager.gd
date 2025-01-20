extends Node


@onready var finish_guide_label: Label = $FinishGuideLabel
@onready var floppy_guide_label: Label = $FloppyGuideLabel
@onready var finish_label: Label = $FinishLabel

@onready var mario_endblock: TileMapLayer = $"TileMapLayers/mario-endblock"
@onready var mario_startblock: TileMapLayer = $"TileMapLayers/mario-startblock"
@onready var floppy_mid: TileMapLayer = $"TileMapLayers/floppy-mid"
@onready var floppy_detector: Area2D = $FloppyDetector
@onready var floppy_deathwalls: TileMapLayer = $"TileMapLayers/floppy-deathwalls"
@onready var floppy_startblock: TileMapLayer = $"TileMapLayers/floppy-startblock"


func _ready() -> void:
	finish_guide_label.set_visible(true)
	floppy_guide_label.set_visible(false)
	finish_label.set_visible(false)
	
	mario_startblock.set_enabled(false)
	mario_endblock.set_enabled(true)
	floppy_startblock.set_enabled(false)


func finished_mario():
	finish_guide_label.set_visible(false)
	floppy_guide_label.set_visible(true)
	
	mario_endblock.set_enabled(false)
	mario_startblock.set_enabled(true)


func finish_game():
	finish_label.set_visible(true)


func restore_coins(collected_coins: Array[Vector2]):
	for coin_pos in collected_coins:
		var scene: PackedScene = load("res://scenes/coin.tscn")
		var instance: Area2D = scene.instantiate()
		instance.global_position = coin_pos
		$Coins.add_child.call_deferred(instance)


func _on_floppy_detector_exit() -> void:
	floppy_startblock.set_enabled(true)
