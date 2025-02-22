extends Node
var putuacion = 0
@onready var label_5: Label = $Label5




func incrementa_un_punto():
	putuacion += 1
	label_5.text = "has botenido "+str(putuacion)+" monedas"
