import 'package:polymer/polymer.dart';

@CustomTag('click-counter')
//class ClickCounter extends PolymerElement with ObservableMixin {
class ClickCounter extends PolymerElement {
  //int count = 0; // does not work
  //@observable int count = 0;
  @published int count = 0;

  void increment() {
    count++;
  }
}

