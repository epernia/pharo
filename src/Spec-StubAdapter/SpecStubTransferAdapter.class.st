"
Adapt the presenter on a stub view that displays no real UI elements.
"
Class {
	#name : #SpecStubTransferAdapter,
	#superclass : #SpecStubAbstractAdapter,
	#category : #Spec-StubAdapter-Adapters
}

{ #category : #factory }
SpecStubTransferAdapter >> buildWidget [

	^ SpecStubTransferView new
]
