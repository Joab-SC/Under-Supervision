extends CanvasLayer

onready var BOTON_A = $OpcionA
onready var BOTON_B= $OpcionB
onready var BOTON_C = $OpcionC
onready var BOTON_D = $OpcionD


const POSICION_1: Vector2 = Vector2(239, 125)
const POSICION_2 : Vector2 = Vector2(327, 125)
const POSICION_3: Vector2 = Vector2(415, 125)
const POSICION_4 : Vector2 = Vector2(503, 125)


enum NPCS {
	Guardia, Rose, Juancho,
	Style, Afro, Ximena,
	Mary
}

const TEXTOS_GUARDIA: Array = [
	"GUARDIA: Buenos días.",
	"GUARDIA: Te sueles portar bien?, más te vale.",
	"GUARDIA: Pero antes, te advierto en que lo único ajeno que pódras llevarte será el conocimiento.",
	"GUARDIA: Sin más que agregar, puedes seguir."
]


const TEXTOS_ROSE: Array = [
	"Rose: ¿Qué tal?",
	"Rose: Necesito tu ayuda.",
	"Rose: Estoy esperando mi turno y quisiera saber si aceptaran mi crédito.",
	"Rose: Los créditos son dados 1 por cada dos personas, ayudame a decifrar el código para saber si tengo chance. ",
	"""
	x = 6
	while x > 0:
	----print(x)
	----x -= 2""",                                                                    
	""
]
const OPCIONES_ROSE: Array = ["6,4,2", "5,3,1", "6,5,4,3,2,1", "6,4,2,0"]


const TEXTOS_JUANCHO: Array = [
	"Juancho: Hola, necesito ayuda.",
	"Juancho: Intento hacer un juego pero una constante no funciona, ¿sabes cuál es el error?",
	"Juancho: Aquí te muestro la constante y de paso me dices que falta.",
	"""
	var ARSENAL: Array = [
	"Espada", "Escudo", "Arco"
	""",
	""
]
const OPCIONES_JUANCHO: Array = ["def", "] ", "print()", "list()"]


const TEXTOS_STYLE: Array = [
	"Style: Mmmmm.",
	"Style: Vaya susto que me diste, estaba intentando decifrar sí la cantidad que necesito es la misma a la de la pantalla.",
	"Style: Se me dificulta un poco estas cosas.",
	"Style: Ya que me has asustado deberías ayudarme.",
	"Style: Es la que está a continuación",
	"Style: Lo dejo en tus manos, suerte con la elección.",
	"""
	print(5==5.0)
	""",
	""
]
const OPCIONES_STYLE: Array = ["None", "False", "Error", "True"]


const TEXTOS_AFRO: Array = [
	"Tefa: ¡Hola! soy Tefa, soy empleada de este banco.",
	"Tefa: Pero apenas estoy aprendiendo, aún se me dificulta un poco.",
	"Tefa: Necesito saber que imprime el siguiente output.",
	"Tefa: ¿Te atreves a ayudarme?.",
	"Tefa: Mira, es este.",
	"""
	texto = "12345"
	resultado = texto.isdigit()
	print(resultado)
	""",
	""
]
const OPCIONES_AFRO:Array = ["True", "False", "Error", "None"]


const TEXTOS_XIMENA: Array = [
	"Ximena: Estoy ocupada, ahora no puedo ayudarte.",
	"Ximena: Mmm, te has quedado, tal vez seas tú el indicado.",
	"Ximena: Me presento, me llamo Ximena y él es mi amigo Willian.",
	"Ximena: Somos los programadores del banco.",
	"Ximena: Y ahora necesitamos de ti.",
	"Ximena: Mira, William y yo intentamos solucionar esto.",
	"""
	lista = [1,2,3,3,4,5]
	lista.remove(3)
	print(lista)
	""",
	""
]
const OPCIONES_XIMENA:Array = ["[1,2,3,3,4,5]", "[1,2,3,3,5]","[1,2,4,5]", "[1,2,3,4,5]"]



const TEXTOS_MARY: Array = [
	"Mary: ¡Hola! ¿Qué necesitas el día de hoy?",
	"Mary: Claro que te ayudaré.",
	"Mary: Pon tu nombre aquí.",
	"Mary: Lo debes de poner con su primera letra en mayúscula.",
	"Mary: ¡Y luego el resto va en minúsculas!",
	"Mary: Vamos a intentar que pasa cuando no se hace de esta manera.",
	"""texto = "Mary es genial"
	resultado = texto.startswith("ma")
	print(resultado)
	""",
	""
]
const OPCIONES_MARY:Array = ["True", "Error", "None", "False"]





var chats: int = 0

var npc: int  

var respuesta: String = "Lo que dices no tiene sentido"


func poner_TEXTO(TEXTO: String, TEXTOS, NPC: int, OPCIONES = []):
	show()
	get_tree().paused = true

	if TEXTOS[-1] == TEXTO and NPC != 0:
		$TEXTO.text = respuesta
	else:
		$TEXTO.text = TEXTO
	npc = NPC
	$ANIM.play("SET_TEXTO")
	
	if TEXTOS[-2] == TEXTO and NPC != 0:
		
		
		$textoA.text = OPCIONES [0]
		$textoB.text = OPCIONES [1]
		$textoC.text = OPCIONES [2]
		$textoD.text = OPCIONES [3]
		
		$textoA.show()
		$textoB.show()
		$textoC.show()
		$textoD.show()
		
		BOTON_A.show()
		BOTON_B.show()
		BOTON_C.show()
		BOTON_D.show()
		
		$ANIM_A.play("PONER_A")
		$ANIM_B.play("PONER_B")
		$ANIM_C.play("PONER_C")
		$ANIM_D.play("PONER_D")
		
		
		TEXTOS[-1] = respuesta
	



func _on_Guardia_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_GUARDIA[chats],TEXTOS_GUARDIA, NPCS.Guardia)
		chats += 1
		
func _on_Rose_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_ROSE[chats],TEXTOS_ROSE, NPCS.Rose)
		chats += 1

func _on_Juancho_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_JUANCHO[chats],TEXTOS_JUANCHO, NPCS.Juancho)
		chats += 1
		
func _on_Style_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_STYLE[chats],TEXTOS_STYLE, NPCS.Style)
		chats += 1
		
func _on_Afro_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_AFRO[chats],TEXTOS_AFRO, NPCS.Afro)
		chats += 1
		
func _on_Ximena_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_XIMENA[chats],TEXTOS_XIMENA, NPCS.Ximena)
		chats += 1
		
func _on_Mary_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_MARY[chats],TEXTOS_MARY, NPCS.Mary)
		chats += 1
		
		
func _on_Button_pressed() -> void:
	BOTON_A.hide()
	BOTON_B.hide()
	BOTON_C.hide()
	BOTON_D.hide()
	
	$textoA.hide()
	$textoB.hide()
	$textoC.hide()
	$textoD.hide()
		
	match npc:
		NPCS.Guardia:
			if chats < TEXTOS_GUARDIA.size():
				poner_TEXTO(TEXTOS_GUARDIA[chats], TEXTOS_GUARDIA, NPCS.Guardia)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.guardia == 0:
					global.puntos += 1
					global.guardia = 1
			else:
				chats -= TEXTOS_GUARDIA.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				get_tree().paused = false
		
		NPCS.Rose:
			if chats < TEXTOS_ROSE.size():
				poner_TEXTO(TEXTOS_ROSE[chats], TEXTOS_ROSE, NPCS.Rose, OPCIONES_ROSE)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.rose == 0:
					global.puntos += 1
					global.rose = 1
				
			else:
				chats -= TEXTOS_ROSE.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Juancho:
			BOTON_A.rect_position = POSICION_2
			BOTON_B.rect_position = POSICION_1
			if chats < TEXTOS_JUANCHO.size():
				poner_TEXTO(TEXTOS_JUANCHO[chats], TEXTOS_JUANCHO, NPCS.Juancho, OPCIONES_JUANCHO)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.juancho == 0:
					global.puntos += 1
					global.juancho = 1
				
			else:
				chats -= TEXTOS_JUANCHO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Style:
			BOTON_A.rect_position = POSICION_4
			BOTON_D.rect_position = POSICION_1
			if chats < TEXTOS_STYLE.size():
				poner_TEXTO(TEXTOS_STYLE[chats], TEXTOS_STYLE, NPCS.Style, OPCIONES_STYLE)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.style == 0:
					global.puntos += 1
					global.style = 1
				
			else:
				chats -= TEXTOS_STYLE.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
			
		NPCS.Afro:
			if chats < TEXTOS_AFRO.size():
				poner_TEXTO(TEXTOS_AFRO[chats], TEXTOS_AFRO, NPCS.Afro, OPCIONES_AFRO)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.afro == 0:
					global.puntos += 1
					global.afro = 1
				
			else:
				chats -= TEXTOS_AFRO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Ximena:
			BOTON_A.rect_position = POSICION_4
			BOTON_D.rect_position = POSICION_1
			if chats < TEXTOS_XIMENA.size():
				poner_TEXTO(TEXTOS_XIMENA[chats], TEXTOS_XIMENA, NPCS.Ximena, OPCIONES_XIMENA)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.ximena == 0:
					global.puntos += 1
					global.ximena = 1
				
			else:
				chats -= TEXTOS_XIMENA.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Mary:
			BOTON_A.rect_position = POSICION_4
			BOTON_D.rect_position = POSICION_1
			if chats < TEXTOS_MARY.size():
				poner_TEXTO(TEXTOS_MARY[chats], TEXTOS_MARY, NPCS.Mary, OPCIONES_MARY)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.mary == 0:
					global.puntos += 1
					global.mary = 1
				
			else:
				chats -= TEXTOS_MARY.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false

func reestablecer_posiciones(primera, segunda, tercera, cuarta):
	primera.rect_position = POSICION_1
	segunda.rect_position = POSICION_2
	tercera.rect_position = POSICION_3
	cuarta.rect_position = POSICION_4




func _on_OpcionA_pressed():
	respuesta = "Bien hecho, ¡Gracias!"


func _on_OpcionB_pressed():
	respuesta = "No te creo mucho."


func _on_OpcionC_pressed():
	respuesta = "Aja, y las nubes son negras.😕😕"


func _on_OpcionD_pressed():
	respuesta = "Intentalo de nuevo."























