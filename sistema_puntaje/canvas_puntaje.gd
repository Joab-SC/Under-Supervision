extends CanvasLayer


func _process(delta):
	$Puntaje.text = str(global.puntos)
	if global.medalla_entregada == true:
		$medalla.show()
