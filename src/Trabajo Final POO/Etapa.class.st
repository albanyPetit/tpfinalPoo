"
Clase que representa el plan de viaje que hace al viaje organizado
"
Class {
	#name : #Etapa,
	#superclass : #Object,
	#instVars : [
		'diaLlegada',
		'duracionEnDias',
		'hotel',
		'tipoPension',
		'colActividades'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
Etapa class >> crear: dia duracion: dias hotel: unhotel pension:tipo actividades:col [
|unaetapa|
unaetapa:=self new.
unaetapa inicializar:dia duracion: dias hotel: unhotel pension:tipo actividades:col.
^unaetapa.
]

{ #category : #inicializadores }
Etapa >> inicializar: dia duracion: dias hotel: unhotel pension:tipo actividades:col [
diaLlegada :=dia.
duracionEnDias :=dias.
hotel:=unhotel.
tipoPension:=tipo.
colActividades :=col.
]

{ #category : #printing }
Etapa >> toString [
|datosEtapa|
datosEtapa:= diaLlegada asString + duracionEnDias asString + hotel asString + tipoPension asString.
colActividades do:[:unaActiv|datosEtapa=datosEtapa + unaActiv toString].
^datosEtapa.
]
