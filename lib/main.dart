import 'package:flutter/material.dart';
import 'package:food_app/widgets/categories_screen.dart';
import 'package:food_app/widgets/meal_detail_screen.dart';
import 'package:food_app/widgets/tabs_screen.dart';
import 'package:food_app/widgets/filter_screen.dart';
import 'package:food_app/widgets/categories_meal_screen.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
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

        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
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


