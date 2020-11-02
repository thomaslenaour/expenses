import 'package:flutter/foundation.dart';

class Category {

  const Category({
      @required this.id,
      @required this.name,
      @required this.color
      })
      : assert(id != null),
        assert(name != null),
        assert(name != null);

  final int id;
  final String name;
  final String color;
}