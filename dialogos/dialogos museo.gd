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
	Esqueleto, Steven, Arqueologa,
	Paleontologo, Estefania, Leonardo,
	Mateo, Cientifico, Paola,
	Profesor, Andrea
}

const TEXTOS_ESQUELETO: Array = [
	"Esqueleto: Hola, soy el Esqueleto. Trabajo aquí recibiendo a los visitantes. Bienvenido al Museo de Arqueología.",
	"Esqueleto: Aquí podrás volver al pasado y vivir la era prehistórica como si estuvieras allí mismo.",
	"Esqueleto: Mmmm, hay bastantes visitas el día de hoy. ¿Sabes? Quizás quieras hablar con ellas.",
	"Esqueleto: Para serte sincero, necesito ayuda de alguien ahora mismo. El guía del museo está enfermo y hay mensajes extraños en cada sección que yo no puedo entender.",
	"Esqueleto:  Le pediría ayuda a algunos conocedores que están aquí, pero dicen que no pueden. Hoy están muy extraños."
]


const TEXTOS_STEVEN: Array = [
	"Steven: ¿Qué tal? Me llamo Steven.",
	"Steven: Me encantan los dinosaurios. Mis favoritos son los omnívoros; creo que son más tranquilos.",
	"Steven: Quisiera saber de hace cuántos años es este fósil, pero aquí no dice nada.",
	"Steven: Quizás en este mensaje está la respuesta, pero no lo puedo comprender. ¿Podrías ayudarme?",
	"""
	def suma_de_cubos(limite):
		----total = sum([num**3 for num in range(1, limite) if num % 2 == 0])
		----return total ** 2
	print(suma_de_cubos(6))""",                                                                    
	""
]
const OPCIONES_STEVEN: Array = ["5184", "4872", "3994", "5263"]


const TEXTOS_ARQUEOLOGA: Array = [
	"Arqueologa: ¡Qué increíbles ejemplares!",
	"Arqueologa: Ah, hola, no te había visto. Soy arqueóloga y me fascina visitar este museo de seguido.",
	"Arqueologa: Aunque la verdad, hace tiempo que no vengo y olvidé traer mis apuntes.",
	"Arqueologa: Yo me encargo de colocar algunos letreros con mensajes ocultos para recordar algunas cosas del museo y los especímenes.",
	"Arqueloga: Aquí hay uno que puse hace tiempo. Quería revisar si funcionaba y tenía el mensaje correcto.",
	"Arqueologa: Pero como te digo, hace tiempo que no vengo y no traje mis apuntes, así que estoy algo perdida.",
	"Arqueologa: Oye, quizás tú me podrías ayudar. Lo apreciaría bastante. Aquí está el mensaje.",
	"""def obtener_valor(diccionario, clave):
	----try:
	--------return diccionario[clave]
	----except KeyError:
	--------return None
	mi_diccionario = {'a': 1, 'b': 2, 'c': 3}
	print(obtener_valor(mi_diccionario, 'd'))
	""",
	""
]
const OPCIONES_ARQUEOLOGA: Array = ["1", "2", "None", "KeyError: 'd'"]


const TEXTOS_PALEONTOLOGO:Array = [
	"Paleontólogo: Si no estoy mal, ese fósil es de la especie...",
	"Paleotólogo: ¡Ah!, hola, soy paleontólogo. Estaba a punto de recordar algo y me distraíste.",
	"Paleontólogo: La arqueóloga que usualmente viene se encarga de señalizar los fósiles, pero me pidió que señalara este.",
	"Paleotólogo:  Se supone que aquí debe estar la especie del ejemplar de este fósil, pero ahora tengo un problema, y es que la vez que lo hice olvidé escribir la respuesta en un papel.",
	"Paleontólogo:  ¿Que yo tengo que poder identificarlos? Por favor, son demasiados para mí; a todos se nos puede olvidar algo.",
	"Paleontólogo: Mejor dime si vas a poder ayudarme a descifrar el mensaje o no. Aquí te lo muestro.",
	"""dinosaurios = {"1": "Tyrannosaurus rex", "2": "Triceratops", "3": "Velociraptor", "4": "Stegosaurus"}
a = range(1, len(dinosaurios), 2)
for i in a:
----del dinosaurios[str(i)]
primer_elemento = next(iter(dinosaurios.values()))
print(primer_elemento)
	""",
	""
]
const OPCIONES_PALEONOTOLOGO: Array = ["T-rex", "Triceratops", "Velociraptor", "Stegosaurus"]


const TEXTOS_ESTEFANIA: Array = [
	"Estefanía: ¡Hola! Soy Estefanía. Estoy de excursión con mis compañeros y vinimos de otra universidad a visitar este gran museo.",
	"Estefanía: Me encanta visitar diferentes museos; siempre hay cosas interesantes por descubrir.",
	"Estefanía: Qué lástima que hoy no he podido concentrarme mucho porque nuestro profesor de programación nos dejó muchas tareas para entregar hoy.",
	"Estefanía: ¡Cómo odio esa materia! Pero la tengo que estudiar porque es un requisito en mi universidad.",
	"Estefanía: Oye, quizás tú me puedas ayudar con la tarea; se ve que eres inteligente.",
	"Estefanía: No es que yo no lo sea, solo que la programación no es lo mío.",
	"Estefanía: Pero bueno, aquí está el ejercicio. Espero que puedas resolverlo.",
	"""def filtrar_pares(lista):
	----pares = [num for num in lista if num % 2 == 0]
	----return pares
	numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	print(filtrar_pares(numeros))
	""",
	""
]
const OPCIONES_ESTEFANIA:Array = ["[2,4,6,8,10]", "[1,3,5,7,9]", "range(1, 11)", "[10,8,6,4,2]"]


const TEXTOS_LEONARDO: Array = [
	"Leonardo: ¡Saludos! Soy Leonardo, un entusiasta de la arqueología y los fósiles.",
	"Leonardo: Me encanta explorar este museo y descubrir los secretos del pasado que se esconden en cada exhibición.",
	"Leonardo: Cada fósil aquí cuenta una historia única sobre la vida en la antigüedad.",
	"Leonardo: Es fascinante imaginar cómo era el mundo hace millones de años a través de estos restos fosilizados.",
	"Leonardo: ¿Sabías que este esqueleto pertenece a una especie extinta que habitó esta región hace eones?",
	"Leonardo: A menudo paso horas examinando cada detalle de los fósiles y tratando de reconstruir cómo era la vida en tiempos remotos.",
	"Leonardo: ¿Te gustaría aprender más sobre la historia detrás de alguna exhibición en particular?",
	"Leonardo: Por cierto, mientras me deleitaba con los fósiles, me encontré con un pequeño enigma de programación.",
	"Leonardo: Es un tanto inusual, lo sé, pero me preguntaba si podrías echarme una mano para resolverlo.",
	"Leonardo: Aquí tienes el ejercicio, espero que puedas resolverlo.",
	"""def calcular_edad_fosil(fecha_actual, fecha_fosil):
	----edad = fecha_actual - fecha_fosil
	----return eda
	
print(calcular_edad_fosil(2024, 1800))""",
""
]
const OPCIONES_LEONARDO:Array = ["324", "1244","124", "224"]



const TEXTOS_MATEO: Array = [
	"Mateo: ¡Hola! ¿Qué te parece este fósil tan intrigante?",
	"Mateo: A veces me pregunto qué secretos podría revelar este fósil sobre la antigua vida en la Tierra.",
	"Mateo: Mis compañeros no saben apreciar este tipo de fósiles, ellos prefieren los dinosaurios de las películas.",
	"Mateo: Que mal que nos dejaron tareas para hoy, cuando estamos de excursión, pero yo la haré en la noche, prefiero ver los fósiles ahora.",
	"Mateo: Oye, pero ahora que recuerdo, ¡olvidé que la actividad es en grupo!",
	"Mateo: No puedo quedarle mal a mi equipo, ¿quizás podrías ayudarme?, no entiendo bien lo que han explicado en la última clase.",
	"Mateo: Aquí está el ejercicio que me corresponde, espero que me seas de ayuda.",
	"""import math
	
	radio = 5
	calcular_area = lambda r: math.pi * r ** 2
	print(calcular_area(radio))
	""",
	""
]
const OPCIONES_MATEO:Array = ["31.42", "78.54", "50.24", "15.71"]


const TEXTOS_CIENTIFICO: Array = [
	"Científico: ¡Increíble! Este carnotauro está en excelente estado de conservación.",
	"Científico: El carnotauro era uno de los depredadores más feroces de su tiempo. ¿Sabías que sus brazos eran incluso más pequeños que los del T-Rex?",
	"Científico: Me pregunto cómo estos magníficos animales realmente vivieron y cazaron.",
	"Científico: Este museo tiene una colección impresionante de fósiles, ¿no crees?",
	"Científico: ¿También te fascinan los dinosaurios? ¡Estupendo!, aquí te podrás divertir por un buen rato.",
	"Científico: Estaba analizando algunos datos sobre estos fósiles y me encontré con un problema bastante interesante, parece algo de programación.",
	"Científico: No sé para que se supone que sirva, pero sabes que siempre es bueno tener todo documentado. Al menos eso hace un buen científico.",
	"Científico: ¿Podrías ayudarme a resolverlo? Pues para confirmar mi solución.",
	"""import random

	lista_numeros = []
	for number in range(10):
	----lista_numeros.append(random.randint(1, 100))
	numero_maximo = max(lista_numeros)
	print("Máx:", numero_maximo)
	""",
	""
]
const OPCIONES_CIENTIFICO:Array = ["Máx: 100", "Máx: 1", "Máx: variable", "Máx: 50"]


const TEXTOS_PAOLA: Array = [
	"Paola: Hola, espero que te estés divirtiendo, al menos más que yo.",
	"Paola: No sabes cuanto detesto tener que venir aquí, a ver unos huesos viejos.",
	"Paola: Hubiera preferido quedarme haciendo algo más, hay muchas otras cosas mas interesantes que esto.",
	"Paola: Deberían hacer una salida para visitar un centro tecnológico, no sé, algo por el estilo",
	"Paola: ¿Sabes?, a diferencia de mis compañeros yo sí estoy estudiando programación, ellos solo lo hacen porque tienen que hacerlo.",
	"Paola: Tenemos algunos ejercicios para hoy, al menos yo ya los hice todos sola.",
	"Paola: Me han dicho que eres bueno, quiero ver si lo eres tanto como yo. Aquí está el problema, te deseo suerte resolviendolo.",
	"""def cont_v(texto):
	----conteo = {'a': 0, 'e': 0, 'o': 0}
	----for letra in texto.lower():
	--------if letra in 'aeo':
	------------conteo[letra] += 1
	----return conteo
	print(cont_v("El murciélago come frutas y vuela en la noche."))""",
	""
]
const OPCIONES_PAOLA:Array = ["{'a':6,'e':5,'o':6}", "{'a':5,'e':4,'o':5}", "{'a':4,'e':6,'o':5}", "{'a':4,'e':5,'o':4}"]


const TEXTOS_PROFESOR: Array = [
	"Profesor: Buenas, ¿cómo estás?",
	"Profesor: Vengo de otra universidad con algunos de mis estudiantes, soy el profesor de historia.",
	"Profesor: Vine con los muchachos para que aprendieran cómo eran las criaturas antes de nuestra existencia.",
	"Profesor: Son majestuosas, mira este T-rex por ejemplo, es simplemente espectacular.",
	"Profesor: Lastimosamente veo que algunos están algo preocupados, es que creo que el profesor de programación les dejó algunas tareas para hoy.",
	"Profesor: No entiendo por qué, está salida es de la institución, y ahora los estudiantes no pueden cumplir con el objetivo de la excursión.",
	"Profesor: Uno de mis estudiantes me pidió ayuda con un ejercicio, pero no lo entiendo muy bien, ni siquiera sé si esto funciona",
	"Profesor: ¿Podrías ayudarme? Aquí está el ejercicio. Es que necesito que ellos puedan prestar atención a la exposición de fósiles.",
	"""try:
----print('A', end='.')
except Exception as bob:
----print('B', end='.')
else:
----print('C', end='.')
print('D', end='.')
	""",
	"",
]
const OPCIONES_PROFESOR:Array = ["A.B.C.D.", "B.D.", "A.D.", "A.C.D."]

const TEXTOS_ANDREA: Array = [
	"Andrea: ¡Hola! Me llamo Andrea. ¡Que bien que vinimos al museo!",
	"Andrea: Creo que es bueno para que podamos despejar un poco la mente y estar en un ambiente diferente.",
	"Andrea: Lo que pasa es que en clase nos dejaron una actividad en grupo. Me preocupa un poco cómo le está yendo a mi equipo.",
	"Andrea: A mí me gusta la programación, pero a veces puede ser un poco abrumadora, especialmente cuando hay tantas tareas.",
	"Andrea: Hoy estamos tratando de resolver varios problemas  que nos dejó nuestro profesor. Este parece no ser tan complicado, pero siento que está hecho para confundirnos.",
	"Andrea: ¿Podrías echarle un vistazo y ayudarme a encontrar la solución? Sería de gran ayuda.",
	"""
message: str = "Bob"" ""is"" ""here"
print(message)
	""",
	"",
]
const OPCIONES_ANDREA:Array = ["SyntaxError", "Bob is here", '"Bob""is""here"', "Bobishere"]



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
	



func _on_Esqueleto_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_ESQUELETO[chats],TEXTOS_ESQUELETO, NPCS.Esqueleto)
		chats += 1

func _on_Steven_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_STEVEN[chats], TEXTOS_STEVEN, NPCS.Steven)
		chats += 1

func _on_Arqueologa_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_ARQUEOLOGA[chats], TEXTOS_ARQUEOLOGA, NPCS.Arqueologa)
		chats += 1


func _on_Paleontologo_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_PALEONTOLOGO[chats], TEXTOS_PALEONTOLOGO, NPCS.Paleontologo)
		chats += 1


func _on_Estefania_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_ESTEFANIA[chats], TEXTOS_ESTEFANIA, NPCS.Estefania)
		chats += 1

func _on_Leonardo_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_LEONARDO[chats], TEXTOS_LEONARDO, NPCS.Leonardo)
		chats += 1

func _on_Mateo_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_MATEO[chats], TEXTOS_MATEO, NPCS.Mateo)
		chats += 1
		
func _on_Cientifico_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_CIENTIFICO[chats], TEXTOS_CIENTIFICO, NPCS.Cientifico)
		chats += 1

func _on_Paola_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_PAOLA[chats], TEXTOS_PAOLA, NPCS.Paola)
		chats += 1
	
func _on_Profesor_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_PROFESOR[chats], TEXTOS_PROFESOR, NPCS.Profesor)
		chats += 1

func _on_Andrea_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_ANDREA[chats], TEXTOS_ANDREA, NPCS.Andrea)
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
		NPCS.Esqueleto:
			if chats < TEXTOS_ESQUELETO.size():
				poner_TEXTO(TEXTOS_ESQUELETO[chats], TEXTOS_ESQUELETO, NPCS.Esqueleto)
				chats += 1
			else:
				chats -= TEXTOS_ESQUELETO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				get_tree().paused = false
		
		NPCS.Steven:
			if chats < TEXTOS_STEVEN.size():
				poner_TEXTO(TEXTOS_STEVEN[chats], TEXTOS_STEVEN, NPCS.Steven, OPCIONES_STEVEN)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.steven == 0:
					global.puntos += 1
					global.steven = 1
			else:
				chats -= TEXTOS_STEVEN.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Arqueologa:
			BOTON_A.rect_position = POSICION_3
			BOTON_C.rect_position = POSICION_1
			
			if chats < TEXTOS_ARQUEOLOGA.size():
				poner_TEXTO(TEXTOS_ARQUEOLOGA[chats], TEXTOS_ARQUEOLOGA, NPCS.Arqueologa, OPCIONES_ARQUEOLOGA)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.arqueologa == 0:
					global.puntos += 1
					global.arqueologa = 1
			else:
				chats -= TEXTOS_ARQUEOLOGA.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Paleontologo:
			BOTON_A.rect_position = POSICION_2
			BOTON_B.rect_position = POSICION_1
			
			if chats < TEXTOS_PALEONTOLOGO.size():
				poner_TEXTO(TEXTOS_PALEONTOLOGO[chats], TEXTOS_PALEONTOLOGO, NPCS.Paleontologo, OPCIONES_PALEONOTOLOGO)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.paleontologo == 0:
					global.puntos += 1
					global.paleontologo = 1
			else:
				chats -= TEXTOS_PALEONTOLOGO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
		
		NPCS.Estefania:
			if chats < TEXTOS_ESTEFANIA.size():
				poner_TEXTO(TEXTOS_ESTEFANIA[chats], TEXTOS_ESTEFANIA, NPCS.Estefania, OPCIONES_ESTEFANIA)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.estefania == 0:
					global.puntos += 1
					global.estefania = 1
			else:
				chats -= TEXTOS_ESTEFANIA.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
		
		NPCS.Leonardo:
			BOTON_A.rect_position = POSICION_4
			BOTON_D.rect_position = POSICION_1
			if chats < TEXTOS_LEONARDO.size():
				poner_TEXTO(TEXTOS_LEONARDO[chats], TEXTOS_LEONARDO, NPCS.Leonardo, OPCIONES_LEONARDO)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.leonardo == 0:
					global.puntos += 1
					global.leonardo = 1
			else:
				chats -= TEXTOS_LEONARDO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Mateo:
			BOTON_A.rect_position = POSICION_2
			BOTON_B.rect_position = POSICION_1
			if chats < TEXTOS_MATEO.size():
				poner_TEXTO(TEXTOS_MATEO[chats], TEXTOS_MATEO, NPCS.Mateo, OPCIONES_MATEO)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.mateo == 0:
					global.puntos += 1
					global.mateo = 1
			else:
				chats -= TEXTOS_MATEO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Cientifico:
			BOTON_A.rect_position = POSICION_3
			BOTON_C.rect_position = POSICION_1
			if chats < TEXTOS_CIENTIFICO.size():
				poner_TEXTO(TEXTOS_CIENTIFICO[chats], TEXTOS_CIENTIFICO, NPCS.Cientifico, OPCIONES_CIENTIFICO)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.cientifico == 0:
					global.puntos += 1
					global.cientifico = 1
			else:
				chats -= TEXTOS_CIENTIFICO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Paola:
			if chats < TEXTOS_PAOLA.size():
				poner_TEXTO(TEXTOS_PAOLA[chats], TEXTOS_PAOLA, NPCS.Paola, OPCIONES_PAOLA)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.paola == 0:
					global.puntos += 1
					global.paola = 1
			else:
				chats -= TEXTOS_PAOLA.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
		
		NPCS.Profesor:
			BOTON_A.rect_position = POSICION_4
			BOTON_D.rect_position = POSICION_1
			if chats < TEXTOS_PROFESOR.size():
				poner_TEXTO(TEXTOS_PROFESOR[chats], TEXTOS_PROFESOR, NPCS.Profesor, OPCIONES_PROFESOR)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.profesor == 0:
					global.puntos += 1
					global.profesor = 1
				
			else:
				chats -= TEXTOS_PROFESOR.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
		
		NPCS.Andrea:
			BOTON_A.rect_position = POSICION_2
			BOTON_B.rect_position = POSICION_1
			if chats < TEXTOS_ANDREA.size():
				poner_TEXTO(TEXTOS_ANDREA[chats], TEXTOS_ANDREA, NPCS.Andrea, OPCIONES_ANDREA)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.andrea == 0:
					global.puntos += 1
					global.andrea = 1
			else:
				chats -= TEXTOS_ANDREA.size()
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
	respuesta = "Creo que no es así, quizás deba preguntarle a alguien más."
	
func _on_OpcionC_pressed():
	respuesta = "Parece que te has equivocado.😕😕"

func _on_OpcionD_pressed():
	respuesta = "Se me hace que también estás algo pérdido."











