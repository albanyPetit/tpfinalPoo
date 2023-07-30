"
Clase abstracta
"
Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'costoPersona',
		'impuesto'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
Viaje class >> crear: unNombre costoPersona: costo impuesto: imp [
|unViaje|
unViaje:= self new.
unViaje inicializar: unNombre costoPersona: costo impuesto: imp.
^unViaje.
]

{ #category : #comparing }
Viaje >> equals:nombreViaje [
^nombre=nombreViaje.
]

{ #category : #propiasDelTipo }
Viaje >> getCostoPersona [
^costoPersona 
]

{ #category : #inicializadores }
Viaje >> inicializar: unNombre costoPersona: costo impuesto: imp [
nombre:=unNombre.
costoPersona:=costo.
impuesto:=imp.
]

{ #category : #printing }
Viaje >> toString [
|datos|
datos:=nombre asString + costoPersona asString + impuesto asString.
^datos.
]
