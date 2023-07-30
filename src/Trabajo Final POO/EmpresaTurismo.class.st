"
Empresa de turismo que ofrece a sus clientes viajes a distintos lugares del mundo
"
Class {
	#name : #EmpresaTurismo,
	#superclass : #Object,
	#instVars : [
		'colClientes',
		'colViajes'
	],
	#classVars : [
		'equivMillas',
		'valorMillas'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
EmpresaTurismo class >> Crear:colViajes [
	|empresaTurismo|
	empresaTurismo:=self new.
	valorMillas:=10.
	equivMillas:=10000.
	empresaTurismo inicializar:colViajes.
	^empresaTurismo
]

{ #category : #otros }
EmpresaTurismo class >> getEquivMillas [
^equivMillas.
]

{ #category : #otros }
EmpresaTurismo class >> getValorMillas [
^valorMillas.
]

{ #category : #inicializadores }
EmpresaTurismo >> Inicializar:viajes [
	colClientes:=OrderedCollection new.
	colViajes:=OrderedCollection new.
	colViajes:=viajes.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> actualizarViaje: unViaje [
unViaje actualizarDisponibilidad.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> agregarExcursion:nombreExc viaje:nombreViaje cliente: dniCliente personas: cantPersonas [
	|logrado unCliente|
	logrado := false.
	unCliente := self encontrarViaje: dniCliente .
	(unCliente isNotNil) ifTrue: [ logrado:= (unCliente agregarExcursionAlContrato:nombreViaje excursion:nombreExc personas:cantPersonas).].
	^logrado .
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> añadirNuevoViaje:nombreV costo:costo impuestos:imp ciudad:ciudad salida:salida regreso:regreso disponibilidad:disp [
	|unViaje|
	unViaje := ViajeEspecial crear: nombreV costoPersona: costo impuesto: imp ciudad: ciudad fechaSalida: salida fechaRegreso: regreso disponibilidad: disp.
	colViajes add: unViaje.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> añadirNuevoViaje:nombreV costo:costo impuestos:imp fechas:colFechas dias:dias plan:plan excursiones:excursiones [
	|unViaje|
	unViaje := ViajeOrganizado crear: nombreV costoPersona: costo impuesto: imp fechas: colFechas Dias: dias planViaje: plan excursiones: excursiones.
	colViajes add: unViaje .
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> cancelarContrato:dniCliente viaje:nombreViaje [
	|reembolso unCliente|
	reembolso:=0.
	unCliente:=self encontrarCliente: dniCliente.
	(unCliente isNotNil)ifTrue:[reembolso:=unCliente cancelarUnContrato:nombreViaje.].
	^reembolso.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> efectivizarContrato:dniCliente viaje:nombreViaje [
|logrado unCliente|
logrado:=false.
unCliente:=self encontrarCliente: dniCliente.
(unCliente isNull)ifFalse:[logrado:=unCliente efectivizarContrato:nombreViaje].
^logrado.


]

{ #category : #propiasDelTipo }
EmpresaTurismo >> eliminarViaje:nombreViaje [
	|logrado unViaje|
	logrado := false.
	unViaje := self encontrarViaje: nombreViaje .
	(unViaje isNotNil) ifTrue:
		[ colClientes do:[:cadaCliente | Transcript show: (cadaCliente cancelarUnContrato: nombreViaje).]. colViajes delete: unViaje. logrado := true.].
	^logrado.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> encontrarCliente:dniCliente [
|unCliente|
unCliente:= colClientes detect:[:cadaCliente| cadaCliente equals:dniCliente] ifNone: [ ^nil ].
^unCliente.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> encontrarViaje:nombreViaje [
|unViaje|
unViaje:= colViajes detect:[:cadaViaje| cadaViaje equals:nombreViaje] ifNone: [ ^nil ].
^unViaje.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> generarContrato:dniCliente nombre:nombreViaje fecha:fechaViaje personas:cantPersonas cuotas:cantCuotas valorPlus:plus [
|unViaje unCliente logrado|
logrado:=false.
unViaje:= self encontrarViaje:nombreViaje.
(unViaje notNil)ifTrue:[(unViaje disponibleParaCantidad:cantPersonas fecha:fechaViaje)ifTrue:[unCliente:= self encontrarCliente:dniCliente.
		(unCliente notNil)ifTrue:[unCliente realizarContrato:unViaje fecha:fechaViaje personas:cantPersonas cuotas:cantCuotas valorPlus:plus.
			logrado:=true]]].
^logrado.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> modificarCiudadDelViaje:nombreViaje ciudad: nuevaCiudad [
	|logrado unViaje|
	logrado := false.
	unViaje := self encontrarViaje: nombreViaje.
	(unViaje isNotNil) ifTrue:[(unViaje esEspecial) ifTrue: [unViaje modificarCiudad:nuevaCiudad.logrado := true.].].
	^logrado.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> modificarContrato:dniCliente viaje: nombreViaje fecha:nuevaFecha [
	|logrado unCliente|
	logrado := false.
	unCliente := self encontrarCliente: dniCliente .
	(unCliente isNotNil) ifTrue:
	[ logrado := unCliente modificarUnContrato:nombreViaje fecha:nuevaFecha.
	(logrado) ifFalse: ["imprimimos por pantalla si desea cancelarlo y en caso de si cancelamos el contrato e imprimimos el reembolso"].].
	^logrado.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> modificarDuracionDeViaje: nombreViaje dias: diasDuracion [
	|logrado unViaje|
	logrado := false.
	unViaje := self encontrarViaje: nombreViaje .
	(unViaje isNotNil) ifTrue: [ (unViaje esOrganizado) ifTrue: [  unViaje modificarDuracion:diasDuracion. logrado := true.]. ].
	^logrado .
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> modificarExcursionesDelViaje:nombreViaje excursiones: nuevasExcursiones [
	|logrado unViaje|
	logrado := false.
	unViaje := self encontrarViaje: nombreViaje.
	(unViaje isNotNil) ifTrue: [ (unViaje esOrganizado) ifTrue:[unViaje modificarExcursiones:nuevasExcursiones.logrado := true.].].
	^logrado.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> modificarPlanDelViaje:nombreViaje plan: nuevoPlan [
	|logrado unViaje|
	logrado := false.
	unViaje := self encontrarViaje: nombreViaje .
	(unViaje isNotNil)ifTrue: [(unViaje esOrganizado)ifTrue:[unViaje modificarPlan:nuevoPlan. logrado:=true.]. ].
	^logrado.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> modificarSalidaViaje:nombreViaje nueva:salidaNueva anterior:salidaVieja [
	|logrado unViaje|
	logrado := false.
	unViaje := self encontrarViaje: nombreViaje .
	(unViaje isNotNil) ifTrue: [
		(unViaje modificarSalida: salidaVieja nueva:salidaNueva)ifTrue:
		[colClientes do:[:cadaCliente | (cadaCliente modificarUnContrato: nombreViaje fecha:salidaNueva) ifFalse:[Transcript show: 'debe reembolsarsele'.]].logrado := true.]].
	^logrado.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> obtenerClientesContratoNoPago [
|listaClientesParaAviso|
listaClientesParaAviso:=OrderedCollection new.
listaClientesParaAviso := colClientes select:[:cadaCliente|cadaCliente tieneContratoProximoAVencer].
^listaClientesParaAviso.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> obtenerInformacionViajes:fecha1 fecha:fecha2 [
	|listaDatosViajes info|
	listaDatosViajes:=OrderedCollection new.
	colViajes do:[:cadaViaje| (cadaViaje disponibilidadEnPeriodo:fecha1 fecha: fecha2)ifTrue:
	[info:= cadaViaje toString. listaDatosViajes add:info.]].
	^listaDatosViajes.
]

{ #category : #propiasDelTipo }
EmpresaTurismo >> pagarCuotas:dniCliente cuotas: cantCuotas [
|logrado unCliente contratoAct|
logrado:=false.
unCliente:=self encontrarCliente:dniCliente.
(unCliente)ifNotNil: [ contratoAct:= unCliente obtenerContratoActual.
	(contratoAct)ifNotNil: [(contratoAct estaPago)ifFalse:[contratoAct registrarPago:cantCuotas.
			logrado:=true]]].
^logrado.
]
