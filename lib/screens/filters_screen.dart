import "package:flutter/material.dart";

import "../models/filters.dart";
import '../main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "filters-screen";

  final Function setFilters;
  final Map<Filter, bool> _filters;

  FiltersScreen(this._filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchListTile(String title, String subTitle, Filter type) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: widget._filters[type],
      onChanged: (newValue) {
        setState(() {
          widget._filters[type] = newValue;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.setFilters(widget._filters),
          )
        ],
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
