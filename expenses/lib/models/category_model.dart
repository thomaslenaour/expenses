import 'category.dart';

class CategoryModel {
  static const _allCategory = <Category>[
    Category(id: 0, name: 'Alimentation', color: '#ffffff')
  ];

  static List<Category> loadCategories() {
    return _allCategory;
  }
}
