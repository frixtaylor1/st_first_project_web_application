Class {
	#name : #ISFT,
	#superclass : #WAComponent,
	#category : #'ISFT-Web-Application'
}

{ #category : #initialization }
ISFT class >> initialize [
	super initialize.
	(WAAdmin register: self asApplicationAt: 'isft')
	preferenceAt: #sessionClass put: WASession; yourself.
]

{ #category : #'private ' }
ISFT >> renderBodyOn: html [
	html div
			id: 'body';
			class: 'row';
			with: [ 	
					html div
						id: 'column1';
						class: 'column';
						with: [ 							
							html text: 'soy una columna'.
						].
					html div
						id: 'column2';
						class: 'column';
						with: [ 
							html text: 'soy una columna'.
						].
					html div
						id: 'column3';
						class: 'column';
						with: [ 
							html text: 'soy una columna'.
						].
			].
]

{ #category : #rendering }
ISFT >> renderContentOn: html [
html div
	id: 'allContent';
	with: [ 
		self 
			renderHeaderOn: html;
			renderBodyOn: html;
			renderFooterOn: html;
			yourself.
	].
]

{ #category : #'private ' }
ISFT >> renderFooterOn: html [
	html div 
		class: 'footer';
		with: [ 
			html text: 'Copyright (c) ' , Date today year printString , ' Kevin D. Taylor'; yourself.	
		].
	
]

{ #category : #'private ' }
ISFT >> renderHeaderOn: html [
	html div
			class: 'header';
			with: [ 
				html image
					id: 'logoImg';
					url: ISFTFileLibrary / 'logo.jpg';
					yourself.
			].
]

{ #category : #updating }
ISFT >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'ISFT N° 151'.
	anHtmlRoot link
		type: 'text/css';
		beStylesheet;
		addAll;
		url: ISFTFileLibrary / 'style.css';
		yourself.
]
