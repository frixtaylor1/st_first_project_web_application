Class {
	#name : #ISFTCssPresenter,
	#superclass : #SpTextPresenter,
	#classInstVars : [
		'cssFileText',
		'buttonBar'
	],
	#category : #'ISFT-Web-Application'
}

{ #category : #emulating }
ISFTCssPresenter class >> buttonClicked [

	| file |
	file := File named: 'C:\temp\style.css' asFileReference fullName.
	file openForWrite.
	file writeStreamDo: [ :stream | 
		stream nextPutAll: self text printString ].
	file close
]

{ #category : #'class initialization' }
ISFTCssPresenter class >> initialize [
	| presenter |
	
	self title.
	self initializeFileText.
	"A generic presenter with a list and an action bar"	
	(presenter := SpPresenter new) 
		layout: (SpBoxLayout newTopToBottom
			spacing: 5; 
			add: (self new
						text: cssFileText;
						beEditable);
			add: (buttonBar := presenter newButtonBar) expand: false;
			yourself).	
		
	buttonBar
		"We want to place the button or the buttons at the end (as is often used in dialogs)"
		placeAtEnd;
		add: (presenter newButton
			icon: (presenter application iconNamed: #smallAdd);
			label: 'save';
			yourself).
	presenter open.
	
]

{ #category : #initialization }
ISFTCssPresenter class >> initializeFileText [
	| file |
	file := File named: 'C:\temp\style.css' asFileReference fullName.
	file readStreamDo: [ :stream | 
		cssFileText := (stream upToEnd) asString.
	].
]

{ #category : #accessing }
ISFTCssPresenter class >> text [
	^self text.
]

{ #category : #specs }
ISFTCssPresenter class >> title [
	^ 'CSS of ISFT Web Application'
]

{ #category : #initialization }
ISFTCssPresenter >> initialize [
	super initialize.
]

{ #category : #accessing }
ISFTCssPresenter >> title [
	^ 'Css ISFT presenter'
]
