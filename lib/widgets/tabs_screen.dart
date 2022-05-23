import 'package:flutter/material.dart';
import 'package:food_app/widgets/categories_screen.dart';
import 'package:food_app/widgets/favorites_screen.dart';
import 'package:food_app/widgets/drawer.dart';
class TabsScreen extends StatefulWidget {

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   final List<Map<String, dynamic>> _pages = [
     {'page':CategoriesScreen(), 'label': 'Categories',},
     {'page':FavoritesScreen(), 'label': 'Your Favourites',},
  ];
   int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['label']),

           ),

          drawer: MainDrawer(),
          body: _pages[_selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPageIndex,
            //type: BottomNavigationBarType.shifting,
            items:[
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favorites',
              ),
            ],
          ),

    );
  }
}

