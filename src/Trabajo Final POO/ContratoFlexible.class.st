"
Contrato Flexible, Subclase de Contrato: como caracteristica tiene el que a partir del pago de un plus es posible reprogramar el viaje para una nueva fecha (el valor del plus varía según el viaje).
"
Class {
	#name : #ContratoFlexible,
	#superclass : #Contrato,
	#instVars : [
		'valorPlus'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
ContratoFlexible class >> crear:unViaje fecha:fechaViaje personas:cantPersonas cuotas:cantCuotas valorPlus:plus millas:cantMillas Cliente:unCliente [
|unFlexible|
unFlexible:=super crear:unViaje fecha:fechaViaje personas:cantPersonas cuotas:cantCuotas valorPlus:plus millas:cantMillas Cliente:unCliente.
unFlexible inicializar: plus.
^unFlexible.
]

{ #category : #propiasDelTipo }
ContratoFlexible >> esFlexible [
	^true.
]

{ #category : #inicializadores }
ContratoFlexible >> inicializar:plus [
valorPlus:=plus. 
]
