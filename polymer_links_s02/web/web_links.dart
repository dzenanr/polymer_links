import 'package:polymer_links/links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('web-links')
class WebLinks extends PolymerElement with ObservableMixin {
  @observable List<Link> webLinks;
}