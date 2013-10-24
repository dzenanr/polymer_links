import 'dart:html';
import 'dart:convert';
import 'package:polymer_links/links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('web-links')
class WebLinks extends PolymerElement {
  @published List<Link> links = Model.one.links;

  WebLinks.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement name = shadowRoot.querySelector("#name");
    InputElement url = shadowRoot.querySelector("#url");
    LabelElement message = shadowRoot.querySelector("#message");
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
      var link = new Link(name.value, url.value);
      links.add(link);
      links.sort();
      save();
    }
  }

  save() {
    window.localStorage['polymer_links'] = JSON.encode(Model.one.toJson());
  }
}