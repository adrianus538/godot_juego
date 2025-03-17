extends Node
var putuacion = 0
@onready var label_5: Label = $Label5

signal putuacion_actualizada(putuacion_actual:int)


func incrementa_un_punto():
	putuacion_actualizada.emit(putuacion)
	putuacion += 1
	label_5.text = "has botenido "+str(putuacion)+" monedas"
