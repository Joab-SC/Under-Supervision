extends CanvasLayer


onready var medalla = get_node("../Puntaje/medalla")
onready var aviso_premio = get_node("../premio")

enum NPCS {
	Vicente, Maicol,
	Luisa, Sebastian,
	Sharif, Sofia, Alcalde
}

const TEXTOS_VICENTE: Array = [
	"Vicente: ¿Qué tal?, soy Vicente y vivo aquí hace un buen tiempo.",
	"Vicente: He estado pensando en cambiarme de banco, al que usualmente voy está un poco lejos de aquí.",
	"Vicente: Deberías entrar a ver como es todo, conozco varias personas que tienen convenio con este."
]

const TEXTOS_MAICOL: Array = [
	"Maicol: Hola, pareces ser nuevo aquí en la ciudad.",
	"Maicol: Acabo de salir del supermercado, estaba comprando alguanas cosas para pasar la semana.",
	"Maicol: Lastimosamente, acaban de cerrar, si es que querías comprar algo."
]

const TEXTOS_LUISA: Array = [
	"Luisa: ¡Hola!, ¡bienvienido a la ciudad!",
	"Luisa: Te encantará el ambiente, usualmente hav bastantes personas por aquí",
	"Luisa: Bueno, aquí hay diferentes lugares que debería visitar, pero aquí te digo los más importantes, para que no te pierdas.",
	"Luisa: El banco queda llendo a la izquierda y luego girando hacia arriba. En caso de que necesites algo de dinero, o mejor, ahorrarlo, ya sabes a donde ir.",
	"Luisa: El hospital queda llando a la izquierda y luego girando hacia abajo. Si necesitas atención médica, o necesitas comprar algún medicamento, podrás ir allí.",
	"Luisa: La biblioteca está ubicada a la derecha y luego girando hacia abajo. Es un muy buen lugar si quieres concentrarte para realizar cualquier tipo de tarea o trabajo.",
	"Luisa: Finalmente, el museo está ubicado a la derecha y luega girando hacia arriba. Es un lugar muy especial,  así que tendrás muchas cosas con que entretenerte.",
	"Luisa: Cada uno de estos lugares están marcados con un letrero, para que los puedas ubicar facilmente. Asegúrate de entrar en todos, y conocer a las diferentes personas de la ciudad",
	"Luisa: Suerte en tu estadía, y que la disfrutes."
]


const TEXTOS_SEBASTIAN: Array = [
	"Sebastian: ¿Qué tál?",
	"Sebastian: Vengo de otra ciudad. Muchas personas me han hablado de este lugar, y quise venir a conocerlo.",
	"Sebastian: Lo que más atrae a los visitantes, es el increíble museo que hay aquí.",
	"Sebastian: Si algún día estás aburrido, puedes entrar.",
	"Sebastian: Al menos de donde vengo no hay lugares tan interesantes."
]

const TEXTOS_SHARIF: Array = [
	"Sharif: Saludos, mi nombre es Sharif.",
	"Sharif: Soy estudiante de un instituto de la ciudad, vine un rato a estudiar en la biblioteca.",
	"Sharif: Acabo de salir de allí. Creo que es el mejor lugar si quieres concentrarte.",
	"Sharif: Deberías entrar si lo que quieres en un lugar con silencio, además puedes tomar algún libro que te interese."
]

const TEXTOS_SOFIA: Array = [
	"Sofía: ¡Hola!, espero que te encuentres bien.",
	"Sofía: Soy una practicante del hospital de la ciudad.",
	"Sofía: Hasta ahora me ha encantado todo, me gusta ayudar a otras personas y hacer lo que pueda por ellas.",
	"Sofía: No olvides que debes agendar alguna cita de vez en cuando para revisar tu estado de salud.",
	"Sofía: Si quieres, puedes ir ahora mismo."
]

var TEXTOS_ALCALDE: Array = [
	"Alcalde: Bienvenido, soy el alcalde de este hermoso lugar.",
	"Alcalde: Espero que te acomodes bien en nuestra ciudad, hay muchas cosas por hacer aquí.",
	"Alcalde: ¿Sabes?, dentro de poco, haré la entrega de algo muy especial a la persona más colaborativa de la ciudad.",
	"Alcalde: Sé que eres nuevo, pero si quieres puedes intentar obtenerlo. De todos modos el premio es lo de menos, ¿o no?",
	"Alcalde: Eso sí, ten en cuentea que hay al menos 29 personas que me han comentado que necesitan algo de ayuda.", 
	"Alcalde: No olvides hablar con Luisa, ella conoce mejor la ciudad que cualquiera.",
	"Alcalde: Hasta pronto, y no olvides lo que te comenté."
]



var chats: int = 0

var npc: int  



func poner_TEXTO(TEXTO: String, NPC: int):
	show()
	get_tree().paused = true
	$TEXTO.text = TEXTO
	npc = NPC
	$ANIM.play("SET_TEXTO")


func _on_Vicente_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_VICENTE[chats], NPCS.Vicente)
		chats += 1

func _on_Maicol_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_MAICOL[chats], NPCS.Maicol)
		chats += 1

func _on_Luisa2_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_LUISA[chats], NPCS.Luisa)
		chats += 1

func _on_Sebastian_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_SEBASTIAN[chats], NPCS.Sebastian)
		chats += 1

func _on_Sharif_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_SHARIF[chats], NPCS.Sharif)
		chats += 1
		
func _on_Sofia_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_SOFIA[chats], NPCS.Sofia)
		chats += 1


func _on_Alcalde_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_ALCALDE[chats], NPCS.Alcalde)
		chats += 1


func _on_Button_pressed() -> void:

	match npc:
		NPCS.Vicente:
			if chats < TEXTOS_VICENTE.size():
				poner_TEXTO(TEXTOS_VICENTE[chats], NPCS.Vicente)
				chats += 1
			else:
				chats -= TEXTOS_VICENTE.size()
				hide()
				get_tree().paused = false
				
		NPCS.Maicol:
			if chats < TEXTOS_MAICOL.size():
				poner_TEXTO(TEXTOS_MAICOL[chats], NPCS.Maicol)
				chats += 1
			else:
				chats -= TEXTOS_MAICOL.size()
				hide()
				get_tree().paused = false
		
		NPCS.Luisa:
			if chats < TEXTOS_LUISA.size():
				poner_TEXTO(TEXTOS_LUISA[chats], NPCS.Luisa)
				chats += 1
			else:
				chats -= TEXTOS_LUISA.size()
				hide()
				get_tree().paused = false

		NPCS.Sebastian:
			if chats < TEXTOS_SEBASTIAN.size():
				poner_TEXTO(TEXTOS_SEBASTIAN[chats], NPCS.Sebastian)
				chats += 1
			else:
				chats -= TEXTOS_SEBASTIAN.size()
				hide()
				get_tree().paused = false
		
		NPCS.Sharif:
			if chats < TEXTOS_SHARIF.size():
				poner_TEXTO(TEXTOS_SHARIF[chats], NPCS.Sharif)
				chats += 1
			else:
				chats -= TEXTOS_SHARIF.size()
				hide()
				get_tree().paused = false
		
		NPCS.Sofia:
			if chats < TEXTOS_SOFIA.size():
				poner_TEXTO(TEXTOS_SOFIA[chats], NPCS.Sofia)
				chats += 1
			else:
				chats -= TEXTOS_SOFIA.size()
				hide()
				get_tree().paused = false
		
		NPCS.Alcalde:
			if chats < TEXTOS_ALCALDE.size():
				poner_TEXTO(TEXTOS_ALCALDE[chats], NPCS.Alcalde)
				chats += 1
			else:
				chats -= TEXTOS_ALCALDE.size()
				hide()
				if global.puntos == 29:
					if global.medalla_entregada == false:
						entregar_medalla()
						TEXTOS_ALCALDE = ["¡Gracias por toda tu labor en la ciudad!"]
					else:
						get_tree().paused = false
				else:
					get_tree().paused = false



func _process(delta):
	if global.puntos == 29:
		TEXTOS_ALCALDE = [
			"Alcalde: ¿Qué tal?, te visto andar por ahí por un buen rato.",
			"Alcalde: Me he enterado por todo lo que has hecho aquí en la ciudad, y estoy completamente sorprendido.",
			"Alcalde: ¿Recuerdas lo que te había comentado la primera vez?, bueno por fin he encontrado a un digno ciudadano de este título.",
			"Alcalde: Ahora sí, debido a todas las personas que has ayudado desde tu llegada, quiero hacerte entrega de algo muy especial.",
			"Alcalde: ¡¡LA MEDALLA DE HONOR!!",
			"Alcalde: Te agradezco por tu apasionada labor en la ciudad, quisiera tener más personas como tú por aquí."
		]



func entregar_medalla():
	get_tree().paused = true
	aviso_premio.show()
	medalla.show()
	global.medalla_entregada = true
	



