support
checkInstallNodeJs
	"self checkInstallNodeJs"
	|result|
	result := (PipeableOSProcess waitForCommand: 
		'nodejs -e "console.log(17+25)" ') output.
	result asInteger = 42
		ifTrue: [ self inform: 'Nodejs GOOD' ]
		ifFalse: [  self error: 'Nodejs NOT GOOD' ].
