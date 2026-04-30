extends Control

func _physics_process(delta: float) -> void:
	$TextureRect/AnimationPlayer.play("bg")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
