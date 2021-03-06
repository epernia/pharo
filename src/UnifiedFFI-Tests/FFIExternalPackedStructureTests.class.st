Class {
	#name : #FFIExternalPackedStructureTests,
	#superclass : #TestCase,
	#category : #UnifiedFFI-Tests
}

{ #category : #tests }
FFIExternalPackedStructureTests >> testExternallyAllocatedStructure [
	| struct struct2 |
	
	struct := FFITestPackedStructure externalNew.
	self assert: struct getHandle isExternalAddress.

	self deny: struct isNull.
	[	struct byte: 10.
		struct short: -20.
		struct long: 100.
		struct float: 1.0.
		struct double: 2.0.
		"struct int64: 123456789101112."
	
		struct2 := FFITestPackedStructure fromHandle: struct getHandle.
	
		self assert: (struct2 byte = 10).
		self assert: (struct2 short = -20).	
		self assert: (struct2 long = 100).	
		self assert: (struct2 float = 1.0).	
		self assert: (struct2 double = 2.0).	
		self flag: #todo. "This is not yet implemented"
		"self assert: (struct2 int64 = 123456789101112)."	 ] 
	ensure: [  struct free ]
]

{ #category : #tests }
FFIExternalPackedStructureTests >> testStructAccess [

	| struct |
	
	struct := FFITestPackedStructure new.
	self deny: struct getHandle class = ExternalAddress.	
	self deny: struct isNull.
	
	struct byte: 10.
	struct short: -20.
	struct long: 100.
	struct float: 1.0.
	struct double: 2.0.
		self flag: #todo. "This is not yet implemented"
	"struct int64: 123456789101112."
	
	self assert: (struct byte = 10).
	self assert: (struct short = -20).	
	self assert: (struct long = 100).	
	self assert: (struct float = 1.0).	
	self assert: (struct double = 2.0).	
	"self assert: (struct int64 = 123456789101112).	"
	
]
