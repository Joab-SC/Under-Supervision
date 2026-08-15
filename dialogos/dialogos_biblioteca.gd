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
	Guardia2, Carlos, Carmen, Jesus,
	Wolf, Ellie, Bibi,
	Max,
}

const TEXTOS_GUARDIA2: Array = [
	"GUARDIA: Buenos días.",
	"GUARDIA: ¿Te sueles portar bien?, más te vale.",
	"GUARDIA: Puedes tomar los libros que quieras, pero recuerda que debes traerlos de vuelta.",
	"GUARDIA: Puedes seguir."
]

const TEXTOS_CARLOS: Array = [
	"Carlos: Que lugar tan hermoso.",
	"Carlos: Se aprende bastante acá.",
	"Carlos: Pero no recuerdo un lugar para comer.",
	"Carlos: Después de tanto estudiar necesito un lugar, me dieron esto, ¿crees que sepas que calle es?",
	"""
	a, b = '1', '2'
	b, c = '3', '4'

	print(a + b + c)""",                                                                    
	""
]
const OPCIONES_CARLOS: Array = ["1234", "8", "10", "134"]


const TEXTOS_CARMEN: Array = [
	"Carmen: Gracias por visitarnos.",
	"Carmen: Eres programador, me dices?.",
	"Carmen: Aquí te dejo un taller, para que alimentes tus conocimientos.",
	"Carmen: Suerte y da una vuelta por la biblioteca, hay mucho por ver.",
	"""
	colores = ['rjo', 'vrd'] 
	for idx, color in enumerate(colores): 
	----print(idx, color)
	""",                                                                    
	""
]
const OPCIONES_CARMEN: Array = ["0 rjo 1 vrd", "I rjo 2 vrd","0 rjo 1 vrd", "1 rjo 1 vr"]

const TEXTOS_JESUS: Array = [
	"Jesus: Hay mucho espacio libre por acá.",
	"Jesus: Espero que nos aportes con un poco de tu conocimiento.",
	"Jesus: Gracias por tu ayuda.",
	"""
	lista_original = [1, 2, 3, 4, 5]
	lista_copia = lista_original.copy()
	lista_copia.append(6)

	print(lista_original)""",                                                                    
	""
]
const OPCIONES_JESUS: Array = ["[1,2,3,4,5,6]", "[1,2,3,4,5]", "[1,2,3,4,5,6,6]", "[6,1,2,3,4,5]"]

const TEXTOS_WOLF: Array = [
	"Wolf: Que lugar tan hermoso.",
	"Wolf: Se aprende bastante acá.",
	"Wolf: Pero no recuerdo un lugar, para comer.",
	"Wolf: Después de tanto estudiar necesito un lugar, me dieron esto, ¿crees que sepas que calle es?",
	"""
	text = 'GRAciaS'
	print(text.capitalize())""",                                                                    
	""
]
const OPCIONES_WOLF: Array = ["gracias", "GRAciaS", "Gracias", "GRACIAS"]

const TEXTOS_ELLIE: Array = [
	"Ellie: Bienvenido soy Ellie.",
	"Ellie: Te invito a que te registres en la hoja.",
	"Ellie: Pero tienes que firmar en la casilla que te corresponde.",
	"Ellie: El siguiente codigo te dirá cuál es la casilla en la cual debes firmar.",
	"""
	numeros = [1, 2, 3, 4, 5]
	resultado = sum(numeros)

	print(resultado)""",                                                                    
	""
]
const OPCIONES_ELLIE: Array = ["[1, 2, 3, 4, 5]", "10", "15", "5"]

const TEXTOS_BIBI: Array = [
	"Bibi: No eres de por aquí, ¿verdad?",
	"Bibi: Tál vez deba ser yo quien te de la bienvenida.",
	"Bibi: Y que mejor manera de hacerlo que con un juego.",
	"Bibi: Decifra el código para saber la posición de lo pedido.",
	"""
	cadena = "Hola gente, sean bienvenidos"
	posicion = cadena.find(",")

	print(posicion)""",                                                                   
	""
]
const OPCIONES_BIBI: Array = ["10", "-1", "5", "True"]

const TEXTOS_MAX: Array = [
	"Max: Qué grandioso.",
	"Max: Hablo de leer, es maravilloso.",
	"Max: Pero este libro necesita una llave.",
	"Max: Decifra si la llave que introduje es correcta.",
	"""
	suma = 5+'5'

	print(suma)""",                                                                    
	""
]
const OPCIONES_MAX: Array = ["55", "10", "'10'", "Error"]



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
	

func _on_guardia2_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_GUARDIA2[chats],TEXTOS_GUARDIA2, NPCS.Guardia2)
		chats += 1


func _on_Carlos_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_CARLOS[chats],TEXTOS_CARLOS, NPCS.Carlos)
		chats += 1
		

func _on_Carmen_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_CARMEN[chats],TEXTOS_CARMEN, NPCS.Carmen)
		chats += 1
		

func _on_Jesus_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_JESUS[chats],TEXTOS_JESUS, NPCS.Jesus)
		chats += 1
		
func _on_Wolf_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_WOLF[chats],TEXTOS_WOLF, NPCS.Wolf)
		chats += 1

func _on_Ellie_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_ELLIE[chats],TEXTOS_ELLIE, NPCS.Ellie)
		chats += 1

func _on_Bibi_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_BIBI[chats],TEXTOS_BIBI, NPCS.Bibi)
		chats += 1
		
func _on_Max_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_MAX[chats],TEXTOS_MAX, NPCS.Max)
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
		
		NPCS.Guardia2:
			if chats < TEXTOS_GUARDIA2.size():
				poner_TEXTO(TEXTOS_GUARDIA2[chats], TEXTOS_GUARDIA2, NPCS.Guardia2)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.guardia2 == 0:
					global.puntos += 1
					global.guardia2 = 1
				
			else:
				chats -= TEXTOS_GUARDIA2.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				get_tree().paused = false
	
		
		NPCS.Carlos:
			BOTON_A.rect_position = POSICION_4
			BOTON_D.rect_position = POSICION_1
			if chats < TEXTOS_CARLOS.size():
				poner_TEXTO(TEXTOS_CARLOS[chats], TEXTOS_CARLOS, NPCS.Carlos, OPCIONES_CARLOS)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.carlos == 0:
					global.puntos += 1
					global.carlos = 1
				
			else:
				chats -= TEXTOS_CARLOS.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Carmen:
			if chats < TEXTOS_CARMEN.size():
				poner_TEXTO(TEXTOS_CARMEN[chats], TEXTOS_CARMEN, NPCS.Carmen, OPCIONES_CARMEN)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.carmen == 0:
					global.puntos += 1
					global.carmen = 1
					
			else:
				chats -= TEXTOS_CARMEN.size()
				respuesta = "No te creó mucho."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Jesus:
			BOTON_A.rect_position = POSICION_2
			BOTON_B.rect_position = POSICION_1
			if chats < TEXTOS_JESUS.size():
				poner_TEXTO(TEXTOS_JESUS[chats], TEXTOS_JESUS, NPCS.Jesus, OPCIONES_JESUS)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.jesus == 0:
					global.puntos += 1
					global.jesus = 1
				
			else:
				chats -= TEXTOS_JESUS.size()
				respuesta = "No te creó mucho."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
			
		NPCS.Wolf:
			BOTON_A.rect_position = POSICION_3
			BOTON_C.rect_position = POSICION_1
			if chats < TEXTOS_WOLF.size():
				poner_TEXTO(TEXTOS_WOLF[chats], TEXTOS_WOLF, NPCS.Wolf, OPCIONES_WOLF)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.wolf == 0:
					global.puntos += 1
					global.wolf = 1
				
			else:
				chats -= TEXTOS_WOLF.size()
				respuesta = "No te creó mucho."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Ellie:
			BOTON_A.rect_position = POSICION_3
			BOTON_C.rect_position = POSICION_1
			if chats < TEXTOS_ELLIE.size():
				poner_TEXTO(TEXTOS_ELLIE[chats], TEXTOS_ELLIE, NPCS.Ellie, OPCIONES_ELLIE)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.ellie == 0:
					global.puntos += 1
					global.ellie = 1
				
			else:
				chats -= TEXTOS_ELLIE.size()
				respuesta = "No te creó mucho."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Bibi:
			if chats < TEXTOS_BIBI.size():
				poner_TEXTO(TEXTOS_BIBI[chats], TEXTOS_BIBI, NPCS.Bibi, OPCIONES_BIBI)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.bibi == 0:
					global.puntos += 1
					global.bibi = 1
				
			else:
				chats -= TEXTOS_BIBI.size()
				respuesta = "No te creó mucho."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Max:
			BOTON_A.rect_position = POSICION_4
			BOTON_D.rect_position = POSICION_1
			if chats < TEXTOS_MAX.size():
				poner_TEXTO(TEXTOS_MAX[chats], TEXTOS_MAX, NPCS.Max, OPCIONES_MAX)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.maxi == 0:
					global.puntos += 1
					global.maxi = 1
				
			else:
				chats -= TEXTOS_MAX.size()
				respuesta = "No te creó mucho."
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
	respuesta = "No te creó mucho."


func _on_OpcionC_pressed():
	respuesta = "Aja, y las nubes son negras.😕😕"


func _on_OpcionD_pressed():
	respuesta = "intentalo de nuevo."





