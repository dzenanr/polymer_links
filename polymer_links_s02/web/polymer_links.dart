//import 'dart:html';

//import 'package:polymer/polymer.dart';
import 'package:polymer_links/links.dart';

//@published var links = new List<Link>();
var links = new List<Link>();

main() {
  var link1 = new Link('On Dart', 'http://ondart.me/');
  var link2 = new Link('Web UI', 'http://www.dartlang.org/articles/web-ui/');
  var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
  links..add(link1)..add(link2)..add(link3);
  //query('#tmpl').model = links;
}