extends Control


func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://intro/introduccion.tscn")


func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://creditos/creditos.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
