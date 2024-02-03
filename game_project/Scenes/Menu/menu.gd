extends Node2D


var peer = ENetMultiplayerPeer.new()
@export var player_scene: PackedScene


func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")
	pass # Replace with function body.

func _on_host_pressed():
	peer.create_server(135)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()


func _on_join_pressed():
	peer.create_client("localhost", 135)
	multiplayer.multiplayer_peer = peer
