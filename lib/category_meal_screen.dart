import "package:flutter/material.dart";

import "./models/category.dart";

class CategoryMealScreen extends StatelessWidget {
  final Category category;

  CategoryMealScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text("The recepy"),
      ),
    );
  }
}
