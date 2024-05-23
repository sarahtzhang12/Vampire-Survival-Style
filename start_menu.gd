extends MarginContainer

@onready var start_game_button = %StartGame

func _ready():
	start_game_button.grab_focus()

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")
	
func _on_quit_game_pressed():
	get_tree().quit()
