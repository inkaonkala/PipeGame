extends Node2D

#@onready var music
#@onready var start_sound




func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")



func _on_cancel_pressed() -> void:
	get_tree().quit()
