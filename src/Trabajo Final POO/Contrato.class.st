"
Contrato de la empresa con un cliente por un viaje
"
Class {
	#name : #Contrato,
	#superclass : #Object,
	#instVars : [
		'nro',
		'fechaContrato',
		'unViaje',
		'fechaViaje',
		'cantidadPersonas',
		'cantidadCuotas',
		'proximoVencimiento',
		'colCuotas',
		'estaPago',
		'estado',
		'colExcElegidas'
	],
	#classVars : [
		'ultimoNro'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
Contrato class >> crear:unViaje fecha:fechaViaje personas:cantPersonas cuotas:cantCuotas valorPlus:plus millas:cantMillas Cliente:unCliente [
|unContrato unNro|
unContrato := self new.
unNro:= self obtenerNro.
unContrato inicializar:unNro viaje:unViaje fecha:fechaViaje personas:cantPersonas cuotas:cantCuotas valorPlus:plus millas:cantMillas Cliente:unCliente.
^unContrato.
]

{ #category : #otros }
Contrato class >> obtenerNro [
|nro|
ultimoNro:=ultimoNro +1.
nro:=ultimoNro.
^nro.
]

{ #category : #propiasDelTipo }
Contrato >> añadirExcursion:nombreExc personas: cantPersonas [
	|logrado unaExc hoy|
	hoy := Date today.
	logrado := false.
	((unViaje esOrganizado) & (cantPersonas < cantidadPersonas) & (fechaViaje subtractDate: hoy)>=7) ifTrue:
	[
	unaExc := unViaje sumarExcursion:nombreExc personas: cantPersonas.
	(unaExc isNotNil) ifTrue:[colExcElegidas add:unaExc. logrado := true.].
	].
	^logrado .
]

{ #category : #propiasDelTipo }
Contrato >> cancelar [
	|cant costoPersona total porc|
	cant := 0.
	(self esActual) ifTrue: [ 
		estado := 'cancelado'.
		costoPersona := unViaje getCostoPersona .
		total := costoPersona * cantidadPersonas .
		porc := self obtenerPorcentaje.
		cant := total * porc. ]. 
	^cant.
]

{ #category : #propiasDelTipo }
Contrato >> correspondeAViaje:nombreViaje [ 
^unViaje equals:nombreViaje.
]

{ #category : #propiasDelTipo }
Contrato >> efectivizar [
|logrado hoy|
logrado:=false.
hoy:=Date today.
((estado='actual')&(fechaViaje=hoy)&(estaPago))ifTrue:[estado:='efectivo'.
	logrado:=true.].
^logrado.
]

{ #category : #propiasDelTipo }
Contrato >> esActual [
^estado='actual'
]

{ #category : #propiasDelTipo }
Contrato >> esFlexible [
	^false.
]

{ #category : #accessing }
Contrato >> estaPago [
^estaPago.
]

{ #category : #propiasDelTipo }
Contrato >> getFechaContrato [
	^fechaContrato .
]

{ #category : #inicializadores }
Contrato >> inicializar:unNro viaje:viaje fecha:fecha personas:cantPersonas cuotas:cuotas valorPlus:plus millas:cantMillas Cliente:unCliente [
|unaFecha aux unaCuota costoPersona equiv montoCuota desc millasDesc valorMillas|
nro:= unNro.
fechaContrato:= Date today.
unViaje:=viaje.
fechaViaje:=fecha.
cantidadPersonas:=cantPersonas.
colCuotas:=SortedCollection sortBlock: [:fecha1 :fecha2 |fecha1 < fecha2].
cantidadCuotas:=cuotas.
estado:='actual'.
estaPago :=false.
colExcElegidas:= OrderedCollection new.
costoPersona:= (unViaje getCostoPersona).
equiv:= (EmpresaTurismo getEquivMillas).
montoCuota:=((costoPersona*cantPersonas)+plus)/cantidadCuotas.
valorMillas:=cantMillas*equiv.
(valorMillas>=(montoCuota*0.1))ifTrue:[
	desc:=montoCuota*0.1.
	montoCuota:=montoCuota - desc.
	millasDesc:=desc/equiv.
	unCliente descontarMillas:millasDesc].

	unaFecha:=fechaContrato addDays: 30.
	proximoVencimiento:=unaFecha.
	aux:=1.
	[aux>cantidadCuotas]whileFalse:[
		unaCuota:= Cuota crear:unaFecha monto:montoCuota.
		colCuotas add:unaCuota.
		unaFecha:=unaFecha addDays:30.
		aux=aux+1].


]

{ #category : #propiasDelTipo }
Contrato >> obtenerPorcentaje [
	|hoy dias porc|
	hoy := Date today.
	dias := fechaViaje subtractDate: hoy.
	(dias > 90)ifTrue:[porc:=0.75.] ifFalse: [(dias between: 60 and: 90)ifTrue:[porc:=0.5.] ifFalse:[porc:=0.25.]].
	^porc.
]

{ #category : #propiasDelTipo }
Contrato >> pagarCuota [
colCuotas removeFirst.
cantidadCuotas:=cantidadCuotas-1.

]

{ #category : #propiasDelTipo }
Contrato >> proximoAVencer [
|rta hoy|
hoy:=Date today.
rta:=false.
(self esActual)ifTrue:[(self estaPago)ifFalse:[rta:=(proximoVencimiento subtractDate: hoy)<= 7]].
^rta.
]

{ #category : #propiasDelTipo }
Contrato >> registrarPago:cantCuotas [
|unaCuota aux|
aux:=cantCuotas.
[(aux=0) | (colCuotas isEmpty) ]whileFalse:[self pagarCuota. aux:=(aux-1).].
(colCuotas isEmpty)ifTrue:[estaPago :=true. proximoVencimiento:=nil] 
ifFalse:[unaCuota:=colCuotas first. proximoVencimiento:= unaCuota getVencimiento].


]

{ #category : #propiasDelTipo }
Contrato >> reprogramar:nuevaFecha [
	|logrado|
	logrado := false.
	(unViaje disponibleParaCantidad: cantidadPersonas fecha: nuevaFecha) ifTrue:[
		fechaViaje := nuevaFecha.
		logrado := true.
		unViaje actualizarDisponibilidad: cantidadPersonas fecha: nuevaFecha.].
	^logrado. 
]
