import 'dart:html';
import 'package:polymer_links/links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('web-links')
class WebLinks extends PolymerElement {
  @published List<Link> weblinks;
  
  add(Event e, var detail, Node target) {
    InputElement name = shadowRoot.query("#name");
    InputElement url = shadowRoot.query("#url");
    LabelElement message = shadowRoot.query("#message");
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'name is mandatory; ${message.text}';
      error = true;
    }
    if (url.value.trim() == '') {
      message.text = 'web link is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var weblink = new Link(name.value, url.value);
      weblinks.add(weblink);
    }
  }
}