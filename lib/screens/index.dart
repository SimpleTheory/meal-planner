import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/screens/general_settings.dart';
import 'package:nutrition_app/screens/ingredients_page.dart';
import 'package:nutrition_app/screens/meal_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap with bloc
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition App'),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 8, 8),
              child: IconButton(icon: const Icon(CupertinoIcons.gear), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const GeneralSettingsPage()));},))
        ],
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: Text('Diets'),
            children: [
              // TODO: List tile widget for all diets
            ],
          ),
          ElevatedButton(
            // title: Text('Meals'),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MealPage()));},
            child: const Text('Meals'),
            // children: [
            //   // TODO: List tile widget for all meals
            // ],
          ),
          ElevatedButton(
            // title: Text('Meals'),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const IngredientPage()));},
              child: const Text('Ingredients'),
            // children: [
            //   // TODO: List tile widget for all meals
            // ],
          ),
          const Text('DEBUG NAVIGATIONS'),
          Expanded(
            child: ListView(
              children: [
                ListTile(title: Text(''), onTap: (){}, tileColor: Colors.green),
                ListTile(title: Text(''), onTap: (){},),
                ListTile(title: Text(''), onTap: (){},),
                ListTile(title: Text(''), onTap: (){},),

              ],
            ),
          )
        ],
      ),
    );
  }
}
