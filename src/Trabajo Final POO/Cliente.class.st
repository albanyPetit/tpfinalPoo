"
Clase que almacena los clientes registrados en la empresa
"
Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'apellido',
		'dni',
		'ciudad',
		'telefono',
		'colContratos'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
Cliente class >> crear: undni apellido: unApellido contrato:unContrato ciudad:unaCiudad telefono:unTelefono [
|uncliente|
uncliente:= self new.
uncliente inicializar: undni apellido: unApellido contrato:unContrato ciudad:unaCiudad telefono:unTelefono.
^uncliente.
]

{ #category : #propiasDelTipo }
Cliente >> ObtenerMillas [
^self subclassResponsibility
]

{ #category : #propiasDelTipo }
Cliente >> agregarExcursionAlContrato:nombreViaje excursion:nombreExc personas:cantPersonas [
	|exito unContrato|
	exito := false.
	unContrato := self recuperarContrato: nombreViaje .
	(unContrato isNotNil) ifTrue: [ exito := (unContrato añadirExcursion:nombreExc personas: cantPersonas). ].
	^exito.
]

{ #category : #propiasDelTipo }
Cliente >> cancelarUnContrato:nombreViaje [
	|monto unContrato equivMillas suma|
	monto := 0.
	unContrato := self recuperarContrato: nombreViaje .
	(unContrato isNotNil) ifTrue:[
		monto := unContrato cancelar.
		(self esFrecuente) ifTrue: [equivMillas := EmpresaTurismo getEquivMillas. suma := monto / equivMillas. self sumarMillas: suma. monto := 0.].].
	^monto.
	
]

{ #category : #propiasDelTipo }
Cliente >> descontarMillas:millasDesc [
^self subclassResponsibility.
]

{ #category : #propiasDelTipo }
Cliente >> efectivizarContrato:nombreViaje [
|exito unContrato logrado|
exito:=false.
unContrato:=self recuperarContrato:nombreViaje.
(unContrato isNotNil)ifTrue:[
	logrado :=unContrato efectivizar.
	(logrado)ifTrue:[
		(self esFrecuente)ifTrue:[
			self sumarMillas.
			exito:=true]]].
^exito.
]

{ #category : #comparing }
Cliente >> equals:dniCliente [
^dniCliente=dni.
]

{ #category : #propiasDelTipo }
Cliente >> esFrecuente [
^false
]

{ #category : #inicializadores }
Cliente >> inicializar: undni apellido: unApellido contrato:unContrato ciudad:unaCiudad telefono:unTelefono [
	colContratos := SortedCollection sortBlock: [ :a :b | a getFechaContrato < b getFechaContrato ].
	colContratos add: unContrato .
	dni := undni .
	apellido := unApellido .
	ciudad := unaCiudad .
	telefono := unTelefono .
]

{ #category : #propiasDelTipo }
Cliente >> modificarUnContrato:nombreViaje fecha:nuevaFecha [
	|exito unContrato|
	exito := false.
	unContrato := self recuperarContrato: nombreViaje.
	(unContrato isNotNil) ifTrue:[(unContrato esFlexible) ifTrue: [exito := unContrato reprogramar:nuevaFecha.].].
	^exito.
]

{ #category : #propiasDelTipo }
Cliente >> obtenerContratoActual [
|contratoAct|
contratoAct:=colContratos detect:[:cadaCont| cadaCont esActual] ifNone: [ ^nil ].
^contratoAct.
]

{ #category : #propiasDelTipo }
Cliente >> realizarContrato:unViaje fecha:fechaViaje personas:cantPersonas cuotas:cantCuotas valorPlus:plus [
|cantMillas unContrato|
cantMillas:=0.
(self esFrecuente)ifTrue:[(Transcript show:'¿Desea usar sus millas para descontar del viaje?')"interfaz grafica"ifTrue:[cantMillas:=self ObtenerMillas]].
unContrato:=Contrato crear:unViaje fecha:fechaViaje personas:cantPersonas cuotas:cantCuotas valorPlus:plus millas:cantMillas Cliente:self.
colContratos add:unContrato.
unViaje actualizarDisponibilidad:cantPersonas fecha:fechaViaje.
]

{ #category : #propiasDelTipo }
Cliente >> recuperarContrato:nombreViaje [
|unContrato|
unContrato:=colContratos detect: [:cadaCont|cadaCont correspondeAViaje:nombreViaje ] ifNone:[^nil].
^unContrato 
]

{ #category : #propiasDelTipo }
Cliente >> sumarMillas [
^self subclassResponsibility.
]

{ #category : #propiasDelTipo }
Cliente >> sumarMillas:unaCant [
	^self subclassResponsibility .
]

{ #category : #propiasDelTipo }
Cliente >> tieneContratoProximoAVencer [
|rta|
rta:=false.
colContratos detect:[:cadaCont|cadaCont proximoAVencer]ifFound:[rta:=true].
^rta.
]
