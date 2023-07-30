"
Clase que nos permite almacenar una instancia de una excursion ofrecida por un viaje organizado y la cantidad de personas que realizaran la excursion.
Cada instancia de esta clase se almacenara en un contrato dado.
"
Class {
	#name : #ExcursionElegida,
	#superclass : #Object,
	#instVars : [
		'cantidadPersonas',
		'unaExcursion'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
ExcursionElegida class >> Crear:cant excursion:exc [
|elegida|
elegida:=self new.
elegida inicializar:cant excursion:exc.
^elegida.
]

{ #category : #inicializadores }
ExcursionElegida >> inicializar:cant excursion:exc [
cantidadPersonas:=cant.
unaExcursion:=exc.
]
