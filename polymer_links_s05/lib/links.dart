library links;

class Link implements Comparable {
  String name;
  Uri url;

  Link(this.name, String link) {
    url = Uri.parse(link);
  }

  Link.fromJson(Map<String, Object> linkMap) {
    name = linkMap['name'];
    url = Uri.parse(linkMap['url']);
  }

  Map<String, Object> toJson() {
    var linkMap = new Map<String, Object>();
    linkMap['name'] = name;
    linkMap['url'] = url.toString();
    return linkMap;
  }

  String toString() {
    return '{name: ${name}, url: ${url.toString()}}';
  }

  /**
   * Compares two links based on their names.
   * If the result is less than 0 then the first link is less than the second,
   * if it is equal to 0 they are equal and
   * if the result is greater than 0 then the first is greater than the second.
   */
  int compareTo(Link link) {
    return name.compareTo(link.name);
  }
}

class Model {
  var links = new List<Link>();

  // singleton design pattern: http://en.wikipedia.org/wiki/Singleton_pattern
  static Model model;
  Model.private();
  static Model get one {
    if (model == null) {
      model = new Model.private();
    }
    return model;
  }
  // singleton

  init() {
    var link1 = new Link('On Dart', 'http://ondart.me/');
    var link2 = new Link('Polymer.dart', 'https://www.dartlang.org/polymer-dart/');
    var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
    Model.one.links
      ..add(link1)
      ..add(link2)
      ..add(link3);
  }

  List<Map<String, Object>> toJson() {
    var linkList = new List<Map<String, Object>>();
    for (Link link in links) {
      linkList.add(link.toJson());
    }
    return linkList;
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
}
