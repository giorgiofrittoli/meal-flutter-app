import "package:flutter/material.dart";

import "../models/meal.dart";
import "../widgets/meal_item.dart";

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favMeals;

  FavoritesScreen(this._favMeals);

  @override
  Widget build(BuildContext context) {
    if (_favMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(_favMeals[index]);
        },
        itemCount: _favMeals.length,
      );
    }
  }
}
