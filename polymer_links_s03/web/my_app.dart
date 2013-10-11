import 'package:polymer_links/links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('my-app')
class MyApp extends PolymerElement {
  //@published var links = new List<Link>();
  //var links = new List<Link>();
  var links = toObservable(new List<Link>());

  /*
  MyApp() {
    var link1 = new Link('On Dart', 'http://ondart.me/');
    var link2 = new Link('Web UI', 'http://www.dartlang.org/articles/web-ui/');
    var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
    links
      ..add(link1)
      ..add(link2)
      ..add(link3); 
  }
  */
  
  void created() {
    super.created();
    
    var link1 = new Link('On Dart', 'http://ondart.me/');
    var link2 = new Link('Web UI', 'http://www.dartlang.org/articles/web-ui/');
    var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
    links
      ..add(link1)
      ..add(link2)
      ..add(link3);
  }
}