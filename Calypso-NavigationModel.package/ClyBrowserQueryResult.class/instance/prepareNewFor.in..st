initialization
prepareNewFor: aQuery in: aNavigationEnvironment
	^self copy 
		environment: aNavigationEnvironment;
		buildingQuery: (aQuery withResult: rawResult);
		rawResult: nil;
		beProtected.