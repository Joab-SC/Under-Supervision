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
	gerente, doctora, Medico,
	Enfermero, Doctor, DoctoraLiss,
	DoctorSam,
}

const TEXTOS_GERENTE: Array = [
	"Gerente: Hola, soy el Gerente de este hospital. Estoy aquí para dar la bienvenida a los visitantes",
	"Gerente: Aquí podrás enriquecerte de información y brindar ayuda a nuestro personal médico.",
	"Gerente: Hoy estamos en un día ajetreado. ¿Sabes? Quizás quieras ir a darle una mano al personal.",
	"Gerente: Hemos estado en una situación bastante embarasoza, parece que el personal ha olvidado algunas cosas y requiere de una vuelta de tuerca",
	"Gerente: Hemos intentado ayudarles, pero nada parece funcionar. esperamos puedas ser de gran ayuda."
]

const TEXTOS_DOCTORA: Array = [
	"Doctora: ¡Oh, hola! Soy médico aquí en este hospital.",
	"Doctora: Hoy he tenido un terrible lapsus de memoria y debo darle atención a mi paciente.",
	"Doctora: Necesito recordar qué analgésico es el más adecuado para tratar el resfriado común.",
	"Doctora: Tengo un libro con la respuesta en clave, pero simplemente no puedo decifrarlo.¿Podrías ayudarme?",
	"""
Medicamentos = ["acetaminofen", "paracetamol", "nospirin","dolex"]
Print(medicamentos[3-2])
	""",                                                              
	"",
]
const OPCIONES_DOCTORA: Array = ["acetaminofén", "dolex", "paracetamol", "nospirpin"]

const TEXTOS_MEDICO: Array = [
	"Médico: ¡Hey hola! Hace un rato te ví por aquí.",
	"Médico: Hoy me acompañan estudiantes de medicina del primer semestre y les he puesto una pequeña prueba.",
	"Médico: Al parecer ninguno de ellos a podido dar con la respuesta, tal vez quieras intentarlo.",
	"Médico: Aquí está la prueba, aunque dudo que puedas resolverla.",
	"Médico: ¡Buena suerte! La necesitarás.",
	"""def calcular_dosis(peso, dosis_por_kg):
----dosis_total = peso * dosis_por_kg
----return dosis_total
peso = 70  
dosis_por_kg = 0.5 
dosis_total = calcular_dosis(peso, dosis_por_kg)
print(dosis_total)
	""",
	""
]
const OPCIONES_MEDICO: Array = ["70", "35", "0,5", "7,5"]


const TEXTOS_ENFERMERO:Array = [
	"Enfermero: ¡Ah! Disculpa, estaba revisando algunos registros médicos y me desconcentré.",
	"Enfermero: Soy el enfermero del equipo. Normalmente, el médico se encarga de señalar los medicamentos, pero esta vez me pidieron que lo hiciera yo.",
	"Enfermero: Debería haber registrado la dosis recomendada para este medicamento, pero olvidé hacerlo",
	"Enfermero: Yo debería poder recordar todas las dosis,pero vamos, todos cometemos errores..",
	"Enfermero: ¿Podrías ayudarme a descifrar cuál es la dosis correcta para este medicamento? Mira la información.",
	"""medicamentos = {"1": "Paracetamol", "2": "Ibuprofeno", "3": "Amoxicilina", "4": "Omeprazol"}
dosis_recomendada = medicamentos.get("2", "No hay dosis recomendada")
print(dosis_recomendada)
	""",
	""
]
const OPCIONES_ENFERMERO: Array = ["Amoxicilina", "Paracetamol", "Acetaminofén", "Ibuprofeno"]


const TEXTOS_DOCTOR: Array = [
	"Doctor: ¡Hola! Soy Joab. Recien estoy en mis primeros dias como médico en este hospital.",
	"Doctor: Me ha encantado trabajar aquí, aunque debo admitir que he estado algo perdido.",
	"Doctor: Ahora mismo me encuentro con el diagnostico de un paciente que me dejó un colega, pero no entiendo qué es lo que trata de decir.",
	"Doctor: ¡Te ves como alguien muy listo! Tal vez puedas ayudarme a descifrar el mensaje de mi colega.",
	"Doctor: ¡Mira! Aquí está el códico: ",
	"""paciente = {"sintomas": ["fiebre", "tos", "migraña"], "signos": {"temp": 38.5, "pulso": 110, "PA": "alta"}}
diagnosticar = lambda p: "Infección" if p["signos"]["temp"] > 37.5 else "Hipertensión" if p["signos"]["PA"] == "alta" else "Resfriado"
diagnostico = diagnosticar(paciente)
print(diagnostico)
	""",
	""
]
const OPCIONES_DOCTOR:Array = ["Hipertensión", "Infección", "38.5", "Error"]


const TEXTOS_DOCTORALISS: Array = [
	"Doctora Liss: ¡Saludos! Soy Liss, estoy en un aprieto de estantería y necesito tu ayuda. ¿Podrías echarme una mano?",
	"Doctora Liss: ¡Gracias! Verás, estoy buscando un medicamento llamado tramadol. Es un analgésico que se usa para tratar el dolor moderado a severo. Funciona al alterar la forma en que el cerebro percibe y responde al dolor.",
	"Doctora Liss: El problema es que tengo tantos medicamentos en mi estantería que me resulta difícil encontrar el tramadol. Pero tengo un pequeño truco: ¡tengo un código que indica la posición exacta del medicamento que necesito en la estantería! ¿Estarías dispuesto a ayudarme a encontrarlo?",
	"Doctora Liss: ¡Excelente! Aquí tienes el código que te ayudará a encontrar el tramadol en mi estantería.",
	"Doctora Liss: Espero con ansias que puedas encontrarlo. ¡Buena suerte!.",
	"""estanteria = ["codeína", "tramadol", "morfina", "diclofenaco", "naproxeno"]
print("Está en la posición:", estanteria.index("tramadol") + 1 if "tramadol" in estanteria else "No encontrado")
""",
""
]
const OPCIONES_DOCTORALISS:Array = ["2", "1","0", "No encontrado"]



const TEXTOS_DOCTORSAM: Array = [
	"Doctor Sam: Hola, he visto que sabes mucho de programación y medicina.",
	"Doctor Sam: Has estado echandole una mano a mis compañeros pero ¿sabes? No necesito que alguien me ayude.",
	"Doctor Sam: Te tengo un pequeño desafío. Es un acertijo que combina mi amor por la medicina y la programación. ¿Te atreves a resolverlo?.",
	"Doctor Sam: Veamos si realmente sabes tanto como dicen por aqui...",
	"""def calcular_imc(peso, altura):
----return peso / (altura ** 2)
peso = 70
altura = 1.75
imc = calcular_imc(peso, altura)
print(f"El IMC del paciente es: {imc:.2f}")
""",
""
]
const OPCIONES_DOCTORSAM:Array = ["1.75", "345", "22.86", "None"]


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
	
func _on_gerente_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_GERENTE[chats],TEXTOS_GERENTE, NPCS.gerente)
		chats += 1

func _on_doctora_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_DOCTORA[chats],TEXTOS_DOCTORA, NPCS.doctora)
		chats += 1

func _on_Medico_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_MEDICO[chats],TEXTOS_MEDICO, NPCS.Medico)
		chats += 1
	
func _on_Enfermero_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_ENFERMERO[chats],TEXTOS_ENFERMERO, NPCS.Enfermero)
		chats += 1
	
func _on_Doctor_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_DOCTOR[chats],TEXTOS_DOCTOR, NPCS.Doctor)
		chats += 1
	
func _on_Doctora_Liss_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_DOCTORALISS[chats], TEXTOS_DOCTORALISS, NPCS.DoctoraLiss)
		chats += 1

func _on_Doctor_Sam_body_entered(body):
	if body.is_in_group("Player"):
		poner_TEXTO(TEXTOS_DOCTORSAM[chats], TEXTOS_DOCTORSAM, NPCS.DoctorSam)
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
		NPCS.gerente:
			if chats < TEXTOS_GERENTE.size():
				poner_TEXTO(TEXTOS_GERENTE[chats], TEXTOS_GERENTE, NPCS.gerente)
				chats += 1
			else:
				chats -= TEXTOS_GERENTE.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				get_tree().paused = false
		
		NPCS.doctora:
			BOTON_A.rect_position = POSICION_3
			BOTON_C.rect_position = POSICION_1
			
			if chats < TEXTOS_DOCTORA.size():
				poner_TEXTO(TEXTOS_DOCTORA[chats], TEXTOS_DOCTORA, NPCS.doctora, OPCIONES_DOCTORA)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.doctora == 0:
					global.puntos += 1
					global.doctora = 1
			else:
				chats -= TEXTOS_DOCTORA.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Medico:
			BOTON_A.rect_position = POSICION_2
			BOTON_B.rect_position = POSICION_1
			
			if chats < TEXTOS_MEDICO.size():
				poner_TEXTO(TEXTOS_MEDICO[chats], TEXTOS_MEDICO, NPCS.Medico, OPCIONES_MEDICO)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.medico == 0:
					global.puntos += 1
					global.medico = 1
			else:
				chats -= TEXTOS_MEDICO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
		NPCS.Enfermero:
			BOTON_A.rect_position = POSICION_4
			BOTON_D.rect_position = POSICION_1
			
			if chats < TEXTOS_ENFERMERO.size():
				poner_TEXTO(TEXTOS_ENFERMERO[chats], TEXTOS_ENFERMERO, NPCS.Enfermero, OPCIONES_ENFERMERO)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.enfermero == 0:
					global.puntos += 1
					global.enfermero = 1
			else:
				chats -= TEXTOS_ENFERMERO.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
		
		NPCS.Doctor:
			BOTON_A.rect_position = POSICION_2
			BOTON_B.rect_position = POSICION_1
			if chats < TEXTOS_DOCTOR.size():
				poner_TEXTO(TEXTOS_DOCTOR[chats], TEXTOS_DOCTOR, NPCS.Doctor, OPCIONES_DOCTOR)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.doctor == 0:
					global.puntos += 1
					global.doctor = 1
			else:
				chats -= TEXTOS_DOCTOR.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
		
		NPCS.DoctoraLiss:
			if chats < TEXTOS_DOCTORALISS.size():
				poner_TEXTO(TEXTOS_DOCTORALISS[chats], TEXTOS_DOCTORALISS, NPCS.DoctoraLiss, OPCIONES_DOCTORALISS)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.doctora_liss == 0:
					global.puntos += 1
					global.doctora_liss = 1
			else:
				chats -= TEXTOS_DOCTORALISS.size()
				respuesta = "Lo que dices no tiene sentido."
				hide()
				reestablecer_posiciones(BOTON_A, BOTON_B, BOTON_C, BOTON_D)
				get_tree().paused = false
				
				
		NPCS.DoctorSam:
			BOTON_A.rect_position = POSICION_3
			BOTON_C.rect_position = POSICION_1
			if chats < TEXTOS_DOCTORSAM.size():
				poner_TEXTO(TEXTOS_DOCTORSAM[chats], TEXTOS_DOCTORSAM, NPCS.DoctorSam, OPCIONES_DOCTORSAM)
				chats += 1
				if respuesta == "Bien hecho, ¡Gracias!" and global.doctor_sam == 0:
					global.puntos += 1
					global.doctor_sam = 1
			else:
				chats -= TEXTOS_DOCTORSAM.size()
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




