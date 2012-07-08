#library('dartxjs.dart');
#import('dart:html');
#import('dart:json');

class DartToJSCommunicator {
  Function _handler;
  
  DartToJSCommunicator() {
    _handler = null;
    window.on.message.add((MessageEvent e) {
      if (_handler == null)
        return;
      try {
        String json_data = e.data;
        Map<String,Object> cmd = JSON.parse(json_data);
        if (!(cmd is Map) || cmd["rcpt"] != "dart") {
          return;
        }
        _handler(cmd["data"]);
      } catch (Exception ex) {
        // ignore data that can't be parsed
      }
    });
  }
  
  void set receiveMessage(Function f) {
    _handler = f;
  }
  
  void sendMessage(Map<String,Object> data) {
    window.postMessage(JSON.stringify({"rcpt":"js", "data":data}), window.location.href);
  }
}
