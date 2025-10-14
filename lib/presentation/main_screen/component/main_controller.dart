import 'dart:async';

class MainController {
  final StreamController<int> naveListener = StreamController<int>.broadcast();

  void changeNav(int index) {
    naveListener.sink.add(index);
  }

  void dispose() {
    naveListener.close();
  }
}
