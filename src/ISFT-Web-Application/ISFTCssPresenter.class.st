Class {
	#name : #ISFTCssPresenter,
	#superclass : #SpTextPresenter,
	#instVars : [
		'fileName',
		'syntaxHighlightTheme',
		'cssTextFile'
	],
	#classInstVars : [
		'cssFileText',
		'buttonBar',
		'fileName',
		'syntaxHighlightTheme'
	],
	#category : #'ISFT-Web-Application'
}

{ #category : #accessing }
ISFTCssPresenter class >> cssFileContent [
	^ cssFileText.
]

{ #category : #'instance creation' }
ISFTCssPresenter class >> fileNamed: aString [ 
	fileName := aString.
]

{ #category : #'class initialization' }
ISFTCssPresenter class >> initialize [
	self initializeCssFileText.
	^ self new
		  text: self cssFileContent asString;
		  open.
]

{ #category : #initialization }
ISFTCssPresenter class >> initializeCssFileText [
	((fileName asString) asFileReference)
	 readStreamDo: [ :stream |
		cssFileText := (stream upToEnd) asString.
	].
]

{ #category : #accessing }
ISFTCssPresenter class >> text [
	^ super text.
]

{ #category : #specs }
ISFTCssPresenter class >> title [
	^ 'CSS of ISFT Web Application'
]

{ #category : #initialization }
ISFTCssPresenter >> initialize [
	super initialize.
	self whenSubmitDo: (self saveChangesOnCssFileText: 'Hola' asString).
	
]

{ #category : #initialization }
ISFTCssPresenter >> saveChangesOnCssFileText: aString [
	((fileName asString) asFileReference) ensureDelete;
		writeStreamDo: [ :stream |
			stream nextPutAll: aString.
		].
]

{ #category : #setter }
ISFTCssPresenter >> value: aString [ 
	cssTextFile := aString.
]
