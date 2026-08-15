extends CanvasLayer

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_pause()
		

func toggle_pause():
	if get_tree().paused:
		hide()  
		get_tree().paused = false  
	else:
		show()  
		get_tree().paused = true  


func _on_Continuar_pressed():
	hide()
	get_tree().paused = false


func _on_Ir_al_principal_pressed():
	hide()
	get_tree().paused = false
	get_tree().change_scene("res://Escenas principales/menu/Menu.tscn")

