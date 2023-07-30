"
Viaje Organizado, Subclase de Viaje: ofrecen varias opciones de fecha de salida, y el cupo correspondiente a cada una. Además se tiene la cantidad de días de duración del viaje y un “plan de viaje” en el que se indican todas las actividades incorporadas en el mismo. El plan de viaje se presenta a partir de las “etapas” que conforman el viaje. Para cada etapa se tiene información del día de llegada, cantidad de días que se permanecerá en la ciudad, hotel, tipo de pensión, lista de actividades (por ejemplo: mañana libre, excursion 1, excursion 2).
"
Class {
	#name : #ViajeOrganizado,
	#superclass : #Viaje,
	#instVars : [
		'colFechasSalida',
		'cantidadDias',
		'planViaje',
		'colExcursiones'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
ViajeOrganizado class >> crear: unNombre costoPersona: costo impuesto: imp fechas:fechas Dias:cantidad planViaje:plan excursiones: colExc [
|unViaje|
unViaje:= self crear: unNombre costoPersona: costo impuesto: imp.
unViaje inicializar: fechas Dias:cantidad planViaje:plan excursiones:colExc.
^unViaje.
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> actualizarDisponibilidad:cantPersonas fecha:fechaViaje [
|fecha logrado|
logrado:=false.
fecha:=colFechasSalida detect:[:cadaFechaSalida|cadaFechaSalida equals:fechaViaje].
(fecha notNil)ifTrue:[fecha actualizarDisponibilidad:cantPersonas].
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> disponibilidadEnPeriodo: fecha1 fecha: fecha2 [
|rta|
rta:=false.
colFechasSalida detect:[:cadaFechaSalida|cadaFechaSalida disponible:fecha1 fecha:fecha2]ifFound:[rta:=true].
^rta.


]

{ #category : #propiasDelTipo }
ViajeOrganizado >> disponibleParaCantidad:cantPersonas fecha:fechaViaje [
|fecha logrado|
logrado:=false.
fecha:=colFechasSalida detect:[:cadaFechaSalida|cadaFechaSalida equals:fechaViaje].
(fecha notNil)ifTrue:[logrado:=fecha estaDisponible:cantPersonas].
^logrado.
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> esEspecial [
	^false.
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> esOrganizado [
	^true.
]

{ #category : #inicializadores }
ViajeOrganizado >> inicializar:fechas Dias:cantidad planViaje:plan excursiones:colExc [
colFechasSalida:=SortedCollection sortBlock: [:fecha1 :fecha2 |fecha1 getFecha < fecha2 getFecha].
colFechasSalida := fechas.
cantidadDias:=cantidad.
planViaje:=plan.
colExcursiones := colExc .
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> modificarDuracion:diasDuracion [
	cantidadDias := diasDuracion .
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> modificarExcursiones:nuevasExcursiones [
	colExcursiones := nuevasExcursiones .
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> modificarPlan:nuevoPlan [
	planViaje := nuevoPlan .
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> modificarSalida: salidaVieja nueva:salidaNueva [
	|exito cadaFechaSalida|
	exito := false.
	cadaFechaSalida := colFechasSalida detect:[:cadaF | (cadaF saleEnFecha:salidaVieja).] ifNone:[^nil].
	(cadaFechaSalida isNotNil) ifTrue:[cadaFechaSalida modificarSalida:salidaNueva. exito := true.].
	^exito.
]

{ #category : #propiasDelTipo }
ViajeOrganizado >> sumarExcursion:nombreExc personas: cantPersonas [
	|cadaExc unaExc|
	cadaExc := colExcursiones detect: [ :exc | exc equals: nombreExc ] ifNone: [ ^nil ].
	(cadaExc isNotNil) ifTrue: [ unaExc := (ExcursionElegida Crear:cantPersonas 	excursion:cadaExc).].
	^unaExc.
]

{ #category : #printing }
ViajeOrganizado >> toString [ 
|datos info datosFecha datosEtapa datosExc|
datos:=super toString.
info:=datos asString + cantidadDias asString.
colFechasSalida do:[:cadaFecha|datosFecha:=cadaFecha toString.
	info:=info + datosFecha asString].
planViaje do:[:cadaEtapa|datosEtapa:=cadaEtapa toString.
	info:=info + cadaEtapa asString].
colExcursiones do:[:cadaExcursion|datosExc:=cadaExcursion toString.
	info:=info + cadaExcursion asString].
^info.
]
