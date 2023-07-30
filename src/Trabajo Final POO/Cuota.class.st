"
Clase que corresponde a las cuotas que debe pagar un cliente por un contrato realizado
"
Class {
	#name : #Cuota,
	#superclass : #Object,
	#instVars : [
		'vencimiento',
		'monto'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
Cuota class >> crear:fecha monto:unMonto [
|unaCuota|
unaCuota:= self new.
unaCuota inicializar:fecha monto:unMonto.
^unaCuota.
]

{ #category : #getters }
Cuota >> getVencimiento [
^vencimiento.
]

{ #category : #inicializadores }
Cuota >> inicializar:fecha monto:unMonto [
vencimiento :=fecha.
monto:=unMonto.
]
