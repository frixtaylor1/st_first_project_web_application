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
	((fileName asString) asFileReference) fullName;
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

{ #category : #'instance creation' }
ISFTCssPresenter >> fileNamed: aFile [
	fileName := aFile.
]

{ #category : #initialization }
ISFTCssPresenter >> initialize [
	super initialize.
	self onClickButton.
]

{ #category : #initialization }
ISFTCssPresenter >> onClickButton [

	self whenSubmitDo: self saveChangesOnCssFileText
]

{ #category : #initialization }
ISFTCssPresenter >> saveChangesOnCssFileText [
	((fileName asString) asFileReference)
		writeStreamDo: [ :stream |
		stream nextPutAll: 'Hello World!! es un NUEVO TEXTO VIEJA!!!'.
	].
	Transcript show: cssTextFile asString.
]

{ #category : #accessing }
ISFTCssPresenter >> syntaxHighlightTheme [
	"The name of the syntax highlight theme to use (e.g. 'Blue', 'Vintage', 'Solarized', 'Tango'). 
	 If not defined, the component will take the default value from the system."

	^ syntaxHighlightTheme.
]

{ #category : #accessing }
ISFTCssPresenter >> title [
	^ 'Css ISFT presenter'
]

{ #category : #initialization }
ISFTCssPresenter >> value: aString [ 
  cssTextFile := aString.
]
