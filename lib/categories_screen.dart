import "package:flutter/material.dart";
import 'package:flutter_complete_guide/category_item.dart';

import "dummy_data.dart";

class CategoryScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        children:
            DUMMY_CATEGORIES.map((catData) => CategoryItem(catData)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
      appBar: AppBar(
        title: const Text("DeliMeals"),
      ),
    );
  }
}
