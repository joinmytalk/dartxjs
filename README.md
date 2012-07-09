dartxjs
=======

dartxjs consists of libraries for Dart and JavaScript that allow programmers to
write browser-based applications in both Dart and JavaScript by providing a
mechanism to send message from Dart to JavaScript and vice versa.

Installation
------------

To install the Dart library, create a pubspec.yaml with the following content:

	dependencies:
	  dartxjs:
	    git: git://github.com/joinmytalk/dartxjs.git

Then run `$DART_SDK/bin/pub install dartxjs`.

To install the JavaScript library, simply copy `dartxjs.js` from the `packages/dartxjs`
directory created by `pub` to wherever you need it and include it like you would
do with any other JavaScript library. There is also a minified version, named
`dartxjs.min.js` available.

Usage
-----

After you have installed dartxjs, include it in your Dart application like this:

	#import('package:dartxjs/dartxjs.dart');

You can now send and receive messages in Dart like this:

	DartToJSCommunicator comm = new DartToJSCommunicator();
	comm.receiveMessage = (m) => print('Hello ${m["msg“]}');
	comm.sendMessage({"msg":"JavaScript"});

And on the JavaScript side:

	JSToDartCommunicator.receiveMessage(function(m) {
		console.log("Hello " + m.msg);
	});
	JSToDartCommunicator.sendMessage({"msg":"Dart"});

License
-------

See the file LICENSE for license information.


Author
------

Andreas Krennmair <ak@synflood.at>
