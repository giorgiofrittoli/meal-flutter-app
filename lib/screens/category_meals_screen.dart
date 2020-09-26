import "package:flutter/material.dart";

import '../models/category.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final category = routeArgs["category"] as Category;
    final catgMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(category.id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(catgMeals[index].title);
        },
        itemCount: catgMeals.length,
      ),
    );
  }
}
