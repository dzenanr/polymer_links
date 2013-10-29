import 'dart:html';
import 'dart:convert';
import 'package:polymer_links/links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('my-app')
class MyApp extends PolymerElement {
  var links = toObservable(new List<Link>());

  MyApp.created() : super.created() {
    load();
  }

  init() {
    var link1 = new Link('On Dart', 'http://ondart.me/');
    var link2 = new Link('Polymer.dart', 'https://www.dartlang.org/polymer-dart/');
    var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
    links..add(link1)..add(link2)..add(link3);
  }

  fromJson(List<Map<String, Object>> linkList) {
    if (!links.isEmpty) {
      throw new Exception('links are not empty');
    }
    for (Map<String, Object> linkMap in linkList) {
      Link link = new Link.fromJson(linkMap);
      links.add(link);
    }
  }

  load() {
    String json = window.localStorage['polymer_links'];
    if (json == null) {
      init();
    } else {
      fromJson(JSON.decode(json));
    }
  }
}