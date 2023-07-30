"
Clase que permite almacenar una instancia del viaje: su fecha posible y la cantidad de cupos disponibles
"
Class {
	#name : #FechaSalida,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'disponibilidad'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
FechaSalida class >> crear: fechas disponibilidad: disp [
|unaFecha|
unaFecha :=self new.
unaFecha inicializar: fechas disponibilidad: disp.
^unaFecha.
]

{ #category : #propiasDelTipo }
FechaSalida >> actualizarDisponibilidad:cantPersonas [
disponibilidad :=disponibilidad-cantPersonas.
]

{ #category : #propiasDelTipo }
FechaSalida >> disponible:fecha1 fecha:fecha2 [
^(fecha between: fecha1 and: fecha2 &(disponibilidad>0)).
]

{ #category : #comparing }
FechaSalida >> equals:fechaViaje [
^fecha=fechaViaje.
]

{ #category : #propiasDelTipo }
FechaSalida >> estaDisponible:cantPersonas [
^disponibilidad >= cantPersonas.
]

{ #category : #propiasDelTipo }
FechaSalida >> getDisponibilidad [
	^disponibilidad .
]

{ #category : #propiasDelTipo }
FechaSalida >> getFecha [
	^fecha .
]

{ #category : #inicializadores }
FechaSalida >> inicializar: fechas disponibilidad: disp [
fecha:=fechas.
disponibilidad := disp.
]

{ #category : #propiasDelTipo }
FechaSalida >> modificarSalida: nueva [
	fecha := nueva.
]

{ #category : #propiasDelTipo }
FechaSalida >> saleEnFecha:salida [
	^fecha = salida.
]

{ #category : #propiasDelTipo }
FechaSalida >> toString [ 
	^fecha asString + disponibilidad asString .
]
