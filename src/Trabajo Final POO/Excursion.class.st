"
Clase que representa las excursiones opcionales que ofrece un viaje organizado
"
Class {
	#name : #Excursion,
	#superclass : #Object,
	#instVars : [
		'valor',
		'nombre'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
Excursion class >> crear: unValor nombre:unNombre [
|unaExc|
unaExc:= self new.
unaExc inicializar: unValor nombre:unNombre.
^unaExc.
]

{ #category : #inicializadores }
Excursion >> inicializar: unValor nombre:unNombre [
valor:=unValor.
nombre:=unNombre.
]

{ #category : #printing }
Excursion >> toString [ 
^valor asString+ nombre asString.
]
