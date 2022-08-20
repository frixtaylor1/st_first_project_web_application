Class {
	#name : #ISFTCssPresenter,
	#superclass : #SpTextPresenter,
	#classInstVars : [
		'cssFileText'
	],
	#category : #'ISFT-Web-Application'
}

{ #category : #'class initialization' }
ISFTCssPresenter class >> initialize [
	self initializeFileText.
	self new
		text: cssFileText;
		editable: true;
		open.
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
ISFTCssPresenter class >> title [
	^ 'CSS of ISFT Web Application'
]

{ #category : #initialization }
ISFTCssPresenter >> initialize [ 
	super initialize.
]
