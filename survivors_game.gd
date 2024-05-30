extends Node2D

@onready var let_it_go = %LetItGo

func _ready():
	%LetItGo.play()

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf_range(20,51)/100.0
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	

func _on_timer_timeout():
	spawn_mob()
	

func _on_player_health_depleted():
	%GameOver.visible = true 
	get_tree().paused = true 
	%LetItGo.stop()
	%Dead.play()

	

