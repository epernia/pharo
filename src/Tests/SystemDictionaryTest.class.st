Class {
	#name : #SystemDictionaryTest,
	#superclass : #DictionaryTest,
	#category : #Tests-System
}

{ #category : #'building suites' }
SystemDictionaryTest class >> shouldInheritSelectors [

^true
]

{ #category : #requirements }
SystemDictionaryTest >> canBeUnhealthy [
	"uses GlobalVariables instead of associations"
	^ false
]

{ #category : #requirements }
SystemDictionaryTest >> classToBeTested [

^ SystemDictionary
]

{ #category : #problems }
SystemDictionaryTest >> testClassComment [
	self should: [self targetClass organization hasComment].
]

{ #category : #tests }
SystemDictionaryTest >> testClassOrTraitNamedReturnsClassForClasses [
	"self debug: #testClassOrTraitNamedReturnsClassForClasses"
	self assert: Object ==  (Smalltalk globals classOrTraitNamed: 'Object').
	self assert: Object ==  (Smalltalk globals classOrTraitNamed: #Object).
]

{ #category : #tests }
SystemDictionaryTest >> testClassOrTraitNamedReturnsNilForGlobals [
	"self debug: #testClassOrTraitNamedReturnsNilForGlobals"
	self assert: nil = (Smalltalk globals classOrTraitNamed: 'Undeclared').
	self assert: nil = (Smalltalk globals classOrTraitNamed: #Undeclared).
]

{ #category : #tests }
SystemDictionaryTest >> testEnvironmentOfOrganization [
	"self debug: #testEnvironmentOfOrganization"
	
	| aDictionary |	
	aDictionary := SystemDictionary withOrganizer: SystemOrganizer new.
	self assert: aDictionary organization environment equals: aDictionary
	
]

{ #category : #tests }
SystemDictionaryTest >> testOrganizationPerInstance [
	"self debug: #testOrganizationPerInstance"
	
	| aDictionary otherDictionary |	
	aDictionary := SystemDictionary withOrganizer: SystemOrganizer new.
	otherDictionary := SystemDictionary withOrganizer: SystemOrganizer new.
	self deny: aDictionary organization = otherDictionary organization.
	
]

{ #category : #tests }
SystemDictionaryTest >> testOtherInstancesOfSystemDictionaryAsString [
	self deny: SystemDictionary new asString = 'Smalltalk'
]

{ #category : #tests }
SystemDictionaryTest >> testOtherInstancesOfSystemDictionaryPrintString [
	self deny: SystemDictionary new printString = 'Smalltalk'
]

{ #category : #tests }
SystemDictionaryTest >> testOtherInstancesOfSystemDictionarySelfEvaluating [
	self deny: SystemDictionary new isSelfEvaluating
]

{ #category : #tests }
SystemDictionaryTest >> testSetOrganizationSetBackPointer [
	"self debug: #testSetOrganizationSetBackPointer"
	
	| sd so |
	sd := SystemDictionary new.
	so := SystemOrganizer new.
	sd organization: so.
	self assert: so environment == sd.
	self assert: sd organization == so
	
]

{ #category : #tests }
SystemDictionaryTest >> testSmalltalkAsString [
	self assert: Smalltalk asString = 'Smalltalk'
]

{ #category : #tests }
SystemDictionaryTest >> testSmalltalkPrintString [
	self assert: Smalltalk printString = 'Smalltalk'
]

{ #category : #tests }
SystemDictionaryTest >> testSmalltalkSelfEvaluating [
	self assert: Smalltalk isSelfEvaluating
]

{ #category : #problems }
SystemDictionaryTest >> testUnCategorizedMethods [
	| categories slips  |	categories := self categoriesForClass: self targetClass.
	slips := categories select: [:each | each = #'as yet unclassified'].
	self should: [slips isEmpty].	
]
