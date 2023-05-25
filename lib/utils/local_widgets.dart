import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/screens/diet_details_screen.dart';
import 'package:nutrition_app/screens/shopping_list_page.dart';
import 'package:nutrition_app/utils/utils.dart';

import '../screens/dri_configs.dart';

// Widget plusSignTile(void Function()? onTap, {EdgeInsets? padding}) =>
//   Padding(
//     padding: padding ?? const EdgeInsets.fromLTRB(10, 10, 10, 10),
//       child: ListTile(
//         onTap: onTap,
//         title: const Center(child: Icon(Icons.add),),
//         tileColor: const Color.fromRGBO(240, 240, 240, 30),
//         shape: const BeveledRectangleBorder(
//           side: BorderSide(color: Color.fromRGBO(150, 150, 150, 80), width: 1),
//     // borderRadius: BorderRadius.(5),
//           ),
//         ),
//       );

class PlusSignTile extends StatelessWidget {
  final void Function(BuildContext context) onTap;
  final EdgeInsets? padding;
  const PlusSignTile(this.onTap, {this.padding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ListTile(
        onTap: () {
          onTap(context);
        },
        title: const Center(child: Icon(Icons.add),),
        tileColor: const Color.fromRGBO(240, 240, 240, 30),
        shape: const BeveledRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(150, 150, 150, 80), width: 1),
          // borderRadius: BorderRadius.(5),
        ),
      ),
    );
  }
}


// Text nutrientText({required Nutrients nutrients, num? grams, String? initText, TextStyle? style}){
//   String serving = grams == null ? '' : ' (${grams}g)';
//   initText ??= 'Serving$serving:  ';
//   return Text(
//       '$initText'
//           "${nutrients.calories.value.round()}\u{1F525}  "
//           '${nutrients.carbohydrate.value.round()}\u{1F35E}  '
//           '${nutrients.protein.value.round()}\u{1F969}  '
//       // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
//           '${nutrients.unsaturatedFat.value.round()}$olive  '
//       // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
//           '${nutrients.saturatedFat.value.round()}$butter',
//     style: style,
//   );
// }

class NutrientText extends StatelessWidget {
  final Nutrients nutrients;
  final num? grams;
  late final String? initText;
  final TextStyle? style;

  NutrientText({required this.nutrients, this.grams, String? initText, this.style, Key? key}) : super(key: key){
    final serving = grams == null ? '' : ' (${grams}g)';
    this.initText = initText ?? 'Serving$serving:  ';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$initText'
          "${nutrients.calories.value.round()}\u{1F525}  "
          '${nutrients.carbohydrate.value.round()}\u{1F35E}  '
          '${nutrients.protein.value.round()}\u{1F969}  '
      // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
          '${nutrients.unsaturatedFat.value.round()}$olive  '
      // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
          '${nutrients.saturatedFat.value.round()}$butter',
      style: style,
    );
  }
}


// Widget dayStyleNutrientDisplay(Nutrients nutrients, DRIS dris){
//   final trackedNuts = dris.comparator(nutrients);
//   List<Widget> nutWidgets = [];
//   for (MapEntry<String, List> nut in trackedNuts.entries){
//     final color = nut.value[2].startsWith(RegExp(r'[+-]')) ? Colors.red : Colors.green;
//     nutWidgets.add(
//       Padding(
//         padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
//         child: Column(
//             children: [
//               Text(DRIS.representor[nut.key] ?? replaceTextForForm(nut.key)),
//               Text(nut.value[2], style: TextStyle(color: color))
//             ]
//         ),
//       )
//     );
//   }
//   return Container(
//     height: 50,
//     width: double.infinity,
//     // child: ListView(
//     //   scrollDirection: Axis.horizontal,
//     //   shrinkWrap: true,
//     //   children: nutWidgets,
//     // ),
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       shrinkWrap: true,
//       itemBuilder: (BuildContext context, int index) => nutWidgets[index],
//       itemCount: nutWidgets.length,
//     ),
//   );
// }

class DayStyleNutrientDisplay extends StatefulWidget {
  final Nutrients nutrients;
  final DRIS dris;
  const DayStyleNutrientDisplay(this.nutrients, this.dris, {Key? key}) : super(key: key);


  @override
  State<DayStyleNutrientDisplay> createState() => _DayStyleNutrientDisplayState();
}

class _DayStyleNutrientDisplayState extends State<DayStyleNutrientDisplay> {
  List<Widget> nutWidgets = [];
  @override
  void initState() {
    final trackedNuts = widget.dris.comparator(widget.nutrients);
    for (MapEntry<String, List> nut in trackedNuts.entries){
      final color = nut.value[2].startsWith(RegExp(r'[+-]')) ? Colors.red : Colors.green;
      nutWidgets.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Column(
                children: [
                  Text(DRIS.representor[nut.key] ?? replaceTextForForm(nut.key)),
                  Text(nut.value[2], style: TextStyle(color: color))
                ]
            ),
          )
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      // child: ListView(
      //   scrollDirection: Axis.horizontal,
      //   shrinkWrap: true,
      //   children: nutWidgets,
      // ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => nutWidgets[index],
        itemCount: nutWidgets.length,
      ),
    );
  }
}

// TODO ADD DRIS TRACKING CAPACITY TO MEAL NUT
// Widget mealStyleNutrientDisplay(Nutrients nutrients){
//   List<Widget> nutWidgets = [];
//   for (MapEntry<String, dynamic> nut in nutrients.attributes__.entries){
//     nutWidgets.add(
//       Padding(
//         padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
//         child: Column(
//             children: [
//               Text(DRIS.representor[nut.key] ?? replaceTextForForm(nut.key)),
//               Text(roundDecimal(nut.value.value.toDouble(), 2).toString())
//             ]
//         ),
//       )
//     );
//   }
//   return Container(
//     height: 50,
//     width: double.infinity,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       shrinkWrap: true,
//       itemBuilder: (BuildContext context, int index)=> nutWidgets[index],
//       itemCount: nutWidgets.length,
//       // children: nutWidgets,
//
//     ),
//   );
// }

class MealStyleNutrientDisplay extends StatefulWidget {
  final Nutrients nutrients;
  const MealStyleNutrientDisplay(this.nutrients, {Key? key}) : super(key: key);

  @override
  State<MealStyleNutrientDisplay> createState() => _MealStyleNutrientDisplayState();
}

class _MealStyleNutrientDisplayState extends State<MealStyleNutrientDisplay> {
  List<Widget> nutWidgets = [];
  @override
  void initState() {
    // TODO: implement initState

    for (MapEntry<String, dynamic> nut in widget.nutrients.attributes__.entries){
      nutWidgets.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Column(
                children: [
                  Text(DRIS.representor[nut.key] ?? replaceTextForForm(nut.key)),
                  Text(roundDecimal(nut.value.value.toDouble(), 2).toString())
                ]
            ),
          )
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index)=> nutWidgets[index],
        itemCount: nutWidgets.length,
        // children: nutWidgets,

      ),
    );
  }
}

// Drawer dietDrawer(Diet diet, BuildContext context)=>Drawer(
//   child: ListView(
//     children: [
//       DrawerHeader(child: Text(diet.name)),
//       ListTile(title: const Text('Days'), onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DietPage(diet: diet)));},),
//       ListTile(title: const Text('Shopping List'), onTap: (){},),
//       ListTile(title: const Text('DRI Configuration'), onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DRIConfigPage()));},),
//       ListTile(title: const Text('Return to Home Page'), onTap: (){Navigator.pop(context); Navigator.pop(context);},),
//     ],
//     // DrawerHeader(child: Text(),)
//   ),
// );

class DietDrawer extends StatelessWidget {
  final Diet diet;
  const DietDrawer(this.diet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(margin: const EdgeInsets.all(0),child: Center(child: Text(diet.name, style: const TextStyle(fontSize: 40),)),),
          ListTile(title: const Text('Days'), onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DietPage()));},),
          ListTile(title: const Text('Shopping List'), onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
          { // TODO RUN A SHOPPING LIST UPDATE BEFORE NAVIGATION WITH BLOC
            return const ShoppingListPage();}));},),
          ListTile(title: const Text('DRI Configuration'), onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DRIConfigPage()));},),
          ListTile(title: const Text('Return to Home Page'), onTap: (){Navigator.pop(context); Navigator.pop(context);},),
        ],
        // DrawerHeader(child: Text(),)
      ),
    );
  }
}

/// Alert Dialogue to prompt user for a string
AlertDialog nameAThing(BuildContext context,
    {required String title, String? labelText, required Function(BuildContext context, String inputValue) onSubmit}) {
  TextEditingController controller = TextEditingController();
  return AlertDialog(
    title: Text(title),
    content: TextFormField(
      decoration: InputDecoration(labelText: labelText),
      controller: controller,
      autofocus: true,
    ),
    actions: [
      Row(
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancel')),
          const Spacer(),
          TextButton(onPressed: (){
            if (!toBool(controller.text)){
              Navigator.pop(context);
              return;
            }
            else{
              onSubmit(context, controller.text);
              Navigator.pop(context);
            }
          }, child: const Text('submit'))
        ],
      ),
    ],
  );
}