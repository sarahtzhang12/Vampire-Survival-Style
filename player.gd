extends CharacterBody2D

signal health_depleted
var health = 100.0
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	

func _physics_process(delta):
	position.x = clamp(position.x, -1000, screen_size.x +1000)
	position.y = clamp (position.y, 1000 , screen_size.y + 1000 )
	
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else: 
		$HappyBoo.play_idle_animation()
		
	const DAMAGE_RATE = 50.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE *  overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0: 
			health_depleted.emit()



