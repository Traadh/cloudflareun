factory
client
	|client cookieJar|
	client := ZnClient new.
	client headerAt: 'User-Agent' put: userAgent.
	cookieJar := client session cookieJar.
	cookieJar add: ((ZnCookie name: '__cfduid' value: cfduid) domain: domain).
	cookieJar add: ((ZnCookie name: 'cf_clearance' value: cf_clearance) domain: domain).
	^client
