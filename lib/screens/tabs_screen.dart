import "package:flutter/material.dart";

import "../main_drawer.dart";
import './categories_screen.dart';
import "./favorites_screen.dart";
import "../models/meal.dart";

class TabsScreen extends StatefulWidget {
  final List<Meal> _favMeals;

  TabsScreen(this._favMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  var _selectedPage = 0;

  @override
  void initState() {
    _pages = [
      {"page": CategoryScreen(), "title": "Categories"},
      {"page": FavoritesScreen(widget._favMeals), "title": "Your favorites"}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage]["page"],
      appBar: AppBar(
        title: Text("${_pages[_selectedPage]["title"]}"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: "Favorties",
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
