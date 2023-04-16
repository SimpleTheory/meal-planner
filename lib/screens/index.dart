import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/screens/general_settings.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ExpansionTile(
              title: Text('Diets'),
              children: [
                // TODO: List tile widget for all diets
              ],
            ),
            ExpansionTile(
              title: Text('Meals'),
              children: [
                // TODO: List tile widget for all meals
              ],
            ),
            ExpansionTile(
              title: Text('Ingredients'),
              children: [
                // TODO: List tile widget for all ingredients
              ],
            ),
          ],
        ),
      ),
    );
  }
}
