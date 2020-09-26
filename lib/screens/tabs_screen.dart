import "package:flutter/material.dart";

import './categories_screen.dart';
import "./favorites_screen.dart";

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        body: TabBarView(
          children: [
            CategoryScreen(),
            FavoritesScreen(),
          ],
        ),
        appBar: AppBar(
          title: Text("Meal"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorites",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
