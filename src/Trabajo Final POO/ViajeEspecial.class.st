"
Viaje Especial, Subclase de Viaje: se contratan para alguna actividad particular (por ejemplo “viaje de compras”, “asistencia al recital de … “, etc). En este caso se registra, además del “nombre” del viaje, la ciudad, fecha de salida y, fecha de regreso (Por ejemplo viaje “Concierto de Los Pericos”, en Córdoba, salida el 19/8, regreso el 22/8, …). También tienen disponibilidad, que se irá actualizando a medida que el viaje sea contratado.
"
Class {
	#name : #ViajeEspecial,
	#superclass : #Viaje,
	#instVars : [
		'ciudad',
		'fechaSalida',
		'fechaRegreso',
		'disponibilidad'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
ViajeEspecial class >> crear: unNombre costoPersona: costo impuesto: imp ciudad:unaciudad fechaSalida: fecha1 fechaRegreso:fecha2 disponibilidad: disp [
|unViaje|
unViaje:= self crear: unNombre costoPersona: costo impuesto: imp.
unViaje inicializar: unaciudad fechaSalida: fecha1 fechaRegreso:fecha2 disponibilidad: disp.
^unViaje.
]

{ #category : #propiasDelTipo }
ViajeEspecial >> actualizarDisponibilidad:cantPersonas fecha:fechaViaje [.
disponibilidad :=disponibilidad - cantPersonas.
]

{ #category : #propiasDelTipo }
ViajeEspecial >> disponibilidadEnPeriodo:fecha1 fecha: fecha2 [
^(fechaSalida between: fecha1 and: fecha2 & (disponibilidad>0)).

]

{ #category : #propiasDelTipo }
ViajeEspecial >> disponibleParaCantidad:cantPersonas fecha:fechaViaje [
^disponibilidad>=cantPersonas.
]

{ #category : #comparing }
ViajeEspecial >> equals:nombreViaje [
^(super equals:nombreViaje) & (disponibilidad>0).
]

{ #category : #propiasDelTipo }
ViajeEspecial >> esEspecial [
	^true.
]

{ #category : #propiasDelTipo }
ViajeEspecial >> esOrganizado [
	^false.
]

{ #category : #inicializadores }
ViajeEspecial >> inicializar: unaciudad fechaSalida: fecha1 fechaRegreso:fecha2 disponibilidad: disp [
ciudad:= unaciudad.
fechaSalida :=fecha1.
fechaRegreso:=fecha2.
disponibilidad :=disp.

]

{ #category : #propiasDelTipo }
ViajeEspecial >> modificarCiudad:nuevaCiudad [
	ciudad := nuevaCiudad .
]

{ #category : #propiasDelTipo }
ViajeEspecial >> modificarSalida: salidaVieja nueva:salidaNueva [
	fechaSalida := salidaNueva.
]

{ #category : #printing }
ViajeEspecial >> toString [ 
|datos info|
 datos:= super toString.
info:= datos asString + ciudad asString + fechaSalida asString + fechaRegreso asString + disponibilidad asString.
^info.
]
