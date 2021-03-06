controlling
updateSelection

	| selectedItems |
	"in some conditions table returnes bad index 0 which should not happens normaly.
	Following select protects from this case"
	selectedItems := table selectedRowIndexes 
		select: [ :i | i between: 1 and: self dataSource numberOfRows ] 
		thenCollect: [:each | self itemAt: each].
	selection := self newSelectionWith: selectedItems.

	shouldRestoreSelection ifTrue: [ 
		changesWasInitiatedByUser 
			ifTrue: [desiredSelection := selection asDesiredSelection]
			ifFalse: [ desiredSelection ifNotNil: [
						desiredSelection checkItemsOfCurrentSelection: selection] ]]