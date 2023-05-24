import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/settings/settings_bloc.dart';
import 'package:nutrition_app/screens/diet_details_screen.dart';
import 'package:nutrition_app/screens/general_settings.dart';
import 'package:nutrition_app/screens/ingredients_page.dart';
import 'package:nutrition_app/screens/meal_page.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/blocs/init/init_bloc.dart';

import '../temp_dummy_data.dart';

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
              child: IconButton(icon: const Icon(CupertinoIcons.gear), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GeneralSettingsPage(
                  context.read<SettingsBloc>().state.settings
                )));
                },))
        ],
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: const Text('Diets'),
            children: [
              PlusSignTile(() {}),
              // ListView.builder(
              //   itemBuilder: (context, index)=>IngredientTile(ingredients[index]),
              //   itemCount: app.length,
              //   shrinkWrap: true,
              //   physics: const ClampingScrollPhysics(),
              // ),
              DietTile(diet)
            ],
          ),
          ElevatedButton(
            // title: Text('Meals'),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MealPage()));},
            child: const Text('Meals'),
            // children: [
            // ],
          ),
          ElevatedButton(
            // title: Text('Meals'),
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: const RouteSettings(name: "/IngredientsPage"),
                      builder: (context) => const IngredientPage()));},
              child: const Text('Ingredients'),
            // children: [
            // ],
          ),
          // const Text('DEBUG NAVIGATIONS'),
          // Expanded(
          //   child: ListView(
          //     children: [
          //       // ListTile(title: Text('Confirm Ingredient Debug'), onTap: (){
          //       //   showDialog(context: context, builder: (context)=>
          //       //      confirmIngredient(ingredients[1], context)
          //       //   );}, tileColor: Colors.green),
          //       // ListTile(title: Text('Meal Maker'), onTap: (){
          //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => const MealMakerPage()));
          //       // }, tileColor: Colors.green),
          //       ListTile(title: Text('cancel dialog'),
          //           onTap: (){showDialog(
          //               context: context,
          //               builder: (context) => deleteConfirmation(onSubmit: (){}, context: context));},
          //           tileColor: Colors.green),
          //       // ListTile(title: Text(''), onTap: (){}, tileColor: Colors.green),
          //       // ListTile(title: Text(''), onTap: (){}, tileColor: Colors.green),
          //       // ListTile(title: Text(''), onTap: (){}, tileColor: Colors.green),
          //
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

class DietPopUpEnumHolder{
  Diet diet;
  PopUpOptions popUpOptions;
  DietPopUpEnumHolder(this.diet, this.popUpOptions);

}

// Widget dietTile(Diet diet, BuildContext context) =>
//     ListTile(
//       title: Text(diet.name),
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => DietPage(diet: diet)));
//       },
//       trailing: PopupMenuButton(
//         // onSelected: (dietPopUpSelection){},
//         itemBuilder: (BuildContext context) => [
//           PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.edit),child: const Text('Edit'),),
//           PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.delete), child: const Text('Delete')),
//           PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.duplicate),child: const Text('Duplicate'),),
//         ],
//       )
//     );

class DietTile extends StatelessWidget {
  final Diet diet;
  const DietTile(this.diet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(diet.name),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DietPage()));
        },
        trailing: PopupMenuButton(
          // onSelected: (dietPopUpSelection){},
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.edit),child: const Text('Rename'),),
            PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.delete), child: const Text('Delete')),
            PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.duplicate),child: const Text('Duplicate'),),
          ],
        )
    );
  }
}

AlertDialog nameADiet(BuildContext context) {
  TextEditingController controller = TextEditingController();
  return AlertDialog(
    title: const Text('Diet Namer'),
    actions: [
      Row(
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancel')),
          const Spacer(),
          TextButton(onPressed: (){}, child: const Text('submit'))
        ],
      ),
    ],
  );
}
