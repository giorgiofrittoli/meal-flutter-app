import "package:flutter/material.dart";

import "../models/meal.dart";
import "../widgets/meal_item.dart";
import '../models/category.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> _avMeals;

  CategoryMealScreen(this._avMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  Category category;
  List<Meal> displayMeals;
  var _doneInitData = false;

  @override
  void initState() {
    //context in inistate is not available, user didchangedependecies
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_doneInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      category = routeArgs["category"] as Category;
      displayMeals = widget._avMeals
          .where((element) => element.categories.contains(category.id))
          .toList();
      _doneInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(displayMeals[index]);
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
