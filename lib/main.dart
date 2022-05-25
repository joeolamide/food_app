import 'package:flutter/material.dart';
import 'package:food_app/models/dummy.dart';
import 'package:food_app/widgets/categories_screen.dart';
import 'package:food_app/widgets/meal_detail_screen.dart';
import 'package:food_app/widgets/tabs_screen.dart';
import 'package:food_app/widgets/filter_screen.dart';
import 'package:food_app/widgets/categories_meal_screen.dart';
import 'package:food_app/models/meals.dart';

void main () => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState((){
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten']! && !meal.isGlutenFree!){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree!){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan!){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian!){
          return false;
        }
        return true;

      }).toList();
    });

  }

  void _toggleFavorite(String mealId){
      final existingIndex =
          _favoriteMeals.indexWhere((meal) => meal.id == mealId);
      if (existingIndex >= 0){
          setState((){
            _favoriteMeals.removeAt(existingIndex);
          });
      }else {
        setState((){
          _favoriteMeals.add(
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
          );
        });
      }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51,51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes:{

        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName:(ctx) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilters),
      },

      onGenerateRoute: (settings){
        print(settings.arguments);
      },

      onUnknownRoute: (settings){
    return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
    },
    );
  }
}


