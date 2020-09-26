import 'package:flutter/material.dart';

import "./screens/meal_detail_screen.dart";
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
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
      home: CategoryScreen(),
      routes: {
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetail.routeName: (ctx) => MealDetail(),
      },
      onGenerateRoute: (settings) {
        print(settings);
        return MaterialPageRoute(builder: (ctx) => CategoryMealScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryMealScreen());
      },
    );
  }
}
