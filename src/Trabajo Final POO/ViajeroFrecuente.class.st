"
Subclase de Cliente: aquellos que realizan al menos un viaje organizado por año
"
Class {
	#name : #ViajeroFrecuente,
	#superclass : #Cliente,
	#instVars : [
		'millas'
	],
	#category : #'Trabajo Final POO'
}

{ #category : #constructor }
ViajeroFrecuente class >> crear: undni apellido: unApellido contrato:unContrato ciudad:unaCiudad telefono:unTelefono millas:mill [
|unFrecuente|
unFrecuente:=self crear: undni apellido: unApellido contrato:unContrato ciudad:unaCiudad telefono:unTelefono.
unFrecuente inicializar:mill.
^unFrecuente.

]

{ #category : #propiasDelTipo }
ViajeroFrecuente >> ObtenerMillas [
^millas.
]

{ #category : #propiasDelTipo }
ViajeroFrecuente >> descontarMillas:millasDesc [
millas:=millas-millasDesc.
]

{ #category : #propiasDelTipo }
ViajeroFrecuente >> esFrecuente [
^true
]

{ #category : #inicializadores }
ViajeroFrecuente >> inicializar:mill [
millas:=mill.
]

{ #category : #propiasDelTipo }
ViajeroFrecuente >> sumarMillas [
|valorMillas|
valorMillas :=EmpresaTurismo getValorMillas.
millas:=millas+valorMillas.
]

{ #category : #propiasDelTipo }
ViajeroFrecuente >> sumarMillas:unaCant [
	millas := millas + unaCant .
]
