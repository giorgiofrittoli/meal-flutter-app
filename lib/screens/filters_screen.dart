import "package:flutter/material.dart";

import '../main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "filters-screen";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

enum Filter { LACTOSE_FREE, GLUTEN_FREE, VEGETARIAN, VEGAN }

class _FiltersScreenState extends State<FiltersScreen> {
  var _filters = {
    Filter.GLUTEN_FREE: false,
    Filter.LACTOSE_FREE: false,
    Filter.VEGETARIAN: false,
    Filter.VEGAN: false
  };

  Widget _buildSwitchListTile(String title, String subTitle, Filter type) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: _filters[type],
      onChanged: (newValue) {
        setState(() {
          _filters[type] = newValue;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluten free",
                  "Only include gluten-free meals.",
                  Filter.GLUTEN_FREE,
                ),
                _buildSwitchListTile(
                  "Lactose free",
                  "Only include lactose-free meals.",
                  Filter.LACTOSE_FREE,
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Only include vegetarian meals.",
                  Filter.VEGETARIAN,
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meals.",
                  Filter.VEGAN,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
