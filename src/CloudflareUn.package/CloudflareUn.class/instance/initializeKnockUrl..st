initialization
initializeKnockUrl: aHostUrlString 
	|cmd headers re|
	cmd := 'nodejs -e ''var cloudscraper = require("cloudscraper"); 
		cloudscraper.get("' , aHostUrlString, '", function(error, response, body) 
		{console.log(body, response); }); '' | grep "_header:" '.
	
	"Cloudflare expects at least a five delay, so the next line will block for 5 to 10 seconds"
	headers := (PipeableOSProcess waitForCommand: cmd) output.

	re := '.*(__cfduid=)([^;]*).*' asRegex.
	re matchesPrefix: headers.
	(cfduid := re subexpression: 3) ifNil: [self error: 'cfduid not found']. 

	re := '.*(cf_clearance=)([^\\]*).*' asRegex.
	re matchesPrefix: headers.
	(cf_clearance := re subexpression: 3) ifNil: [self error: 'cf_clearance not found']. 

	re := '.*(User-Agent\: )([^\\]*).*' asRegex.
	re matchesPrefix: headers.
	(userAgent := re subexpression: 3) ifNil: [self error: 'userAgent not found']. 
	
	domain := aHostUrlString asUrl host.