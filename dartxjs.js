JSToDartCommunicator = (function() {

	var addEventListener = function(elem, event, f) {
		if (elem.addEventListener) {
			elem.addEventListener(event, f, false);
		} else if (elem.attachEvent) {
			elem.attachEvent('on' + event, f);
		} else {
			throw "couldn't attach event " + event + " to " + elem;
		}
	};

	return {
		sendMessage: function(data) {
			window.postMessage(JSON.stringify({"rcpt":"dart", "data":data}), window.location.href);
		},

		receiveMessage: function(f) {
			addEventListener(window, 'message', function(event) {
				try {
					var pkt = JSON.parse(event.data);
					if (pkt.rcpt == "js") {
						f(pkt["data"]);
					}
				} catch (e) {
					// ignore exceptions
				}
			});
		}
	}
})();
