import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/filters_screen.dart';
import "./screens/meal_detail_screen.dart";
import './screens/category_meals_screen.dart';
import "./screens/tabs_screen.dart";
import "./models/filters.dart";
import "./models/meal.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = {
    Filter.GLUTEN_FREE: false,
    Filter.LACTOSE_FREE: false,
    Filter.VEGETARIAN: false,
    Filter.VEGAN: false
  };

  List<Meal> _avMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void _setFilters(Map<Filter, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avMeals = DUMMY_MEALS.where((meal) {
        if (_filters[Filter.GLUTEN_FREE] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters[Filter.LACTOSE_FREE] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters[Filter.VEGETARIAN] && !meal.isVegetarian) {
          return false;
        }
        if (_filters[Filter.VEGAN] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _addFav(String mealId) {
    final foundIndex = _favMeals.indexWhere((element) => element.id == mealId);
    setState(() {
      if (foundIndex != -1) {
        _favMeals.removeAt(foundIndex);
      } else {
        _favMeals.add(_avMeals.firstWhere((element) => element.id == mealId));
      }
    });
  }

  bool isMealFav(String mealId) {
    return _favMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: "RobotoCondendsed",
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        "/": (ctx) => TabsScreen(_favMeals),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(_avMeals),
        MealDetail.routeName: (ctx) => MealDetail(_addFav, isMealFav),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings);
        return MaterialPageRoute(
            builder: (ctx) => CategoryMealScreen(_avMeals));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CategoryMealScreen(_avMeals));
      },
    );
  }
}
