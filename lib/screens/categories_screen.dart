import 'package:flutter/material.dart';
import '/dummy_data.dart';
import '../widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  // CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(25),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color),
          )
          .toList(),
    );
  }
}
