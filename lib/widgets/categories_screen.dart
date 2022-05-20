import 'package:flutter/material.dart';
import 'package:food_app/models/dummy.dart';
import 'package:food_app/widgets/category_item.dart';


//create a stateless widget.
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //we use gridview since the items will lie next to each other.
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),

        body:GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id!,
                catData.title,
                catData.color,
              ),
        )
            .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
          ),
        ),
    );
  }
}
