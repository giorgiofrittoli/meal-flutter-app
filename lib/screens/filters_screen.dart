import "package:flutter/material.dart";

import '../main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = "filters-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
    );
  }
}
