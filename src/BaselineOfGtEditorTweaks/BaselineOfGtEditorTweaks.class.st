Class {
	#name : #BaselineOfGtEditorTweaks,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtEditorTweaks
}

{ #category : #loading }
BaselineOfGtEditorTweaks class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-editor-tweaks' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtEditorTweaks >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtEditorTweaks'
		]
]
