import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(
    this.saveFilters,
    this.currentFilters,
  );

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              // now we'll use the SwitchListTile to create switch button with some text
              SwitchListTile(
                title: const Text('Gluten-Free'),
                value: _glutenFree,
                subtitle: const Text('Only include gluten-Free meal'),
                onChanged: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Lactose-Free'),
                value: _lactoseFree,
                subtitle: const Text('Only include Lactose-free meal'),
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Vegeterian'),
                value: _vegetarian,
                subtitle: const Text('Only include vegeterian meal'),
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Vegan'),
                value: _vegan,
                subtitle: const Text('Only include vegan meal'),
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
