tests
testCheckIfEmpty

	query scope: (ClyMethodScope of: {self class >> #writer1OfVar1}).
	self deny: (query isEmptyIn: environment).

	query scope: (ClyMethodScope of: {self class >> #readerOfVar1 }).
	self assert: (query isEmptyIn: environment)