import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  // const TabScreen({Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);

  static const routeName = '/';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;

  int _selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(widget.favoriteMeals),
        'title': 'Favourite',
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              // color: Colors.white,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              // color: Colors.white,
            ),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
