import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({super.key});
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

// this format is workable for parsing data by constructor,
  // void SelectCategory(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(builder: (_) {
  //       return CategoryMealScreen(id, title);
  //     }),
  //   );
  // }

// this format is workable for parsing data through Named Routes
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      //pushNamed doesn't take MaterialPageRoute, it takes named parameter, the path
      CategoryMealScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title, style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
