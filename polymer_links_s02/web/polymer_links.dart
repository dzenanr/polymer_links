import 'dart:html';
import 'package:polymer_links/links.dart';

var links = new List<Link>();

main() {
  var link1 = new Link('On Dart', 'http://ondart.me/');
  var link2 = new Link('Polymer.dart', 'https://www.dartlang.org/polymer-dart/');
  var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
  links..add(link1)..add(link2)..add(link3);
  querySelector('#tmpl').model = links;
}