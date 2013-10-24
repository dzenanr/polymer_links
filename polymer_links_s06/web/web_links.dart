import 'dart:html';
import 'dart:convert';
import 'package:polymer_links/links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('web-links')
class WebLinks extends PolymerElement {
  @published Links links = Model.one.links;

  WebLinks.created() : super.created() {
    print('created WebLinks model links: ${Model.one.links.internalList}');
    print('created WebLinks links: ${links.internalList}');
  }

  add(Event e, var detail, Node target) {
    InputElement name = shadowRoot.querySelector("#name");
    InputElement url = shadowRoot.querySelector("#url");
    LabelElement message = shadowRoot.querySelector("#message");
    var error = false;
    message.text = '';
    if (name.value.trim() == '') error = true;
    if (url.value.trim() == '') error = true;
    if (!error) {
      var link = new Link(name.value, url.value);
      if (links.add(link)) {
        links.order();
        print('add WebLinks model links: ${Model.one.links.internalList}');
        print('add WebLinks links: ${links.internalList}');
        save();
      } else {
        message.text = 'web link with that name already exists';
      }
    }
  }

  delete(Event e, var detail, Node target) {
    InputElement name = shadowRoot.query("#name");
    InputElement url = shadowRoot.query("#url");
    LabelElement message = shadowRoot.query("#message");
    message.text = '';
    Link link = links.find(name.value);
    if (link == null) {
      message.text = 'web link with this name does not exist';
    } else {
      url.value = link.url.toString();
      if (links.remove(link)) save();
    }
  }

  save() {
    window.localStorage['polymer_links'] = JSON.encode(Model.one.toJson());
  }
}