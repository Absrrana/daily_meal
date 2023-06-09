import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  // const FavouriteScreen(List<Meal> favoriteMeals, {Key? key}) : super(key: key);
  final List<Meal> favoriteMeals;
  FavouriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites yet - start adding some !',
          style: Theme.of(context).textTheme.headline1,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
