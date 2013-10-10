import 'package:polymer/polymer.dart';

@CustomTag('web-links')
class WebLinks extends PolymerElement {
  //@published List webLinks = 
  List webLinks = // no need for @published
    ['http://ondart.me/',
     'https://www.dartlang.org/polymer-dart/'];
}