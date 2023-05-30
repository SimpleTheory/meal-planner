import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/domain.dart';
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
        title: const Center(
          child: Icon(Icons.add),
        ),
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

  NutrientText({required this.nutrients,
    this.grams,
    String? initText,
    this.style,
    Key? key})
      : super(key: key) {
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

  const DayStyleNutrientDisplay(this.nutrients, this.dris, {Key? key})
      : super(key: key);

  @override
  State<DayStyleNutrientDisplay> createState() =>
      _DayStyleNutrientDisplayState();
}

class _DayStyleNutrientDisplayState extends State<DayStyleNutrientDisplay> {
  List<Widget> nutWidgets = [];

  @override
  void initState() {
    final trackedNuts = widget.dris.comparator(widget.nutrients);
    for (MapEntry<String, List> nut in trackedNuts.entries) {
      final color =
      nut.value[2].startsWith(RegExp(r'[+-]')) ? Colors.red : Colors.green;
      nutWidgets.add(Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Column(children: [
          Text(DRIS.representor[nut.key] ?? replaceTextForForm(nut.key)),
          Text(nut.value[2], style: TextStyle(color: color))
        ]),
      ));
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
Widget mealStyleNutrientDisplay(Nutrients nutrients) {
  List<Widget> nutWidgets = [];
  for (MapEntry<String, dynamic> nut in nutrients.attributes__.entries) {
    nutWidgets.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: Column(children: [
        Text(DRIS.representor[nut.key] ?? replaceTextForForm(nut.key)),
        Text(nut.value.value % 1 == 0
            ? nut.value.value.toInt().toString()
            : roundDecimal(nut.value.value.toDouble(), 2).toString())
      ]),
    ));
  }
  return Container(
    height: 50,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => nutWidgets[index],
      itemCount: nutWidgets.length,
      // children: nutWidgets,
    ),
  );
}

class MealStyleNutrientDisplay extends StatefulWidget {
  final Nutrients nutrients;

  const MealStyleNutrientDisplay(this.nutrients, {Key? key}) : super(key: key);

  @override
  State<MealStyleNutrientDisplay> createState() =>
      _MealStyleNutrientDisplayState();
}

class _MealStyleNutrientDisplayState extends State<MealStyleNutrientDisplay> {
  List<Widget> nutWidgets = [];

  @override
  void initState() {
    // TODO: implement initState

    for (MapEntry<String, dynamic> nut
    in widget.nutrients.attributes__.entries) {
      nutWidgets.add(Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Column(children: [
          Text(DRIS.representor[nut.key] ?? replaceTextForForm(nut.key)),
          Text(roundDecimal(nut.value.value.toDouble(), 2).toString())
        ]),
      ));
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
        itemBuilder: (BuildContext context, int index) => nutWidgets[index],
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
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            child: Center(
                child: Text(
                  diet.name,
                  style: const TextStyle(fontSize: 40),
                )),
          ),
          ListTile(
            title: const Text('Days'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DietPage(diet)));
            },
          ),
          ListTile(
            title: const Text('Shopping List'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    // TODO RUN A SHOPPING LIST UPDATE BEFORE NAVIGATION WITH BLOC
                    return const ShoppingListPage();
                  }));
            },
          ),
          ListTile(
            title: const Text('DRI Configuration'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DRIConfigPage(diet)));
            },
          ),
          ListTile(
            title: const Text('Return to Home Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
        // DrawerHeader(child: Text(),)
      ),
    );
  }
}

final zeroNut = Nutrients.zero();
final List<Nutrient> nutList = List<Nutrient>.from(zeroNut.attributes__.values);

/// Alert Dialogue to prompt user for a string
AlertDialog nameAThing(BuildContext context,
    {required String title,
      String? labelText,
      required Function(BuildContext context, String inputValue) onSubmit}) {
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
          TextButton(
              onPressed: () {
                if (!toBool(controller.text)) {
                  Navigator.pop(context);
                  return;
                } else {
                  onSubmit(context, controller.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('submit'))
        ],
      ),
    ],
  );
}

String replaceTextForForm(String input) {
  final lowercase = input.toLowerCase();
  if (lowercase == 'ala' ||
      lowercase == 'epa' ||
      lowercase == 'dha' ||
      lowercase == 'dpa') {
    return input.toUpperCase();
  }
  final uppercaseRegex = RegExp(r'([A-Z])', caseSensitive: true);
  input =
      input.replaceAllMapped(uppercaseRegex, (Match m) => ' ${m[1]}').trim();
  input = input.substring(0, 1).toUpperCase() + input.substring(1);
  return input;
}

void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: ListTile(
        leading: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        title: Text(
          message,
          maxLines: 5,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        selectedColor: Colors.red,
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}

class MealComponentTile extends StatelessWidget {
  final MealComponent meal;
  final expansionController = ExpansionTileController();

  MealComponentTile(this.meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.trailing,
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (meal.reference is Meal)
          if (toBool((meal.reference as Meal).notes))
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        mealNotesPopUp(meal.reference as Meal, context));
              },
              icon: const Icon(Icons.info_outline),
            ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) =>
          [
            PopupMenuItem(
              value: MealComponentPopUpEnumHolder(meal, PopUpOptions.edit),
              child: const Text('Edit'),
            ),
            PopupMenuItem(
                value: MealComponentPopUpEnumHolder(meal, PopUpOptions.delete),
                child: const Text('Delete')),
            PopupMenuItem(
              value: MealComponentPopUpEnumHolder(meal, PopUpOptions.duplicate),
              child: const Text('Duplicate'),
            ),
          ],
        ),
        ExpandIcon(onPressed: (bool val) {
          val ? expansionController.expand() : expansionController.collapse();
        })
      ]),
      // subtitle: nutrientText(nutrients: meal.nutrients, grams: meal.grams.round()),
      // subtitle: RichText(
      //   text: TextSpan(
      //     children:[
      //       TextSpan(text: 'Serving:  '),
      //       TextSpan(text: "${meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "),
      //       TextSpan(text: '\u{1F525}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '),
      //       TextSpan(text: '\u{1F35E}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '),
      //       TextSpan(text: '\u{1F969}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
      //       TextSpan(text: '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '),
      //       TextSpan(text: '$olive  ', style: GoogleFonts.notoColorEmoji()),
      //       // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
      //       TextSpan(text: '${meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'),
      //       TextSpan(text: '$butter  ', style: GoogleFonts.notoColorEmoji()),
      //     ]
      //   )
      // ),
      leading: GetImage(meal.reference.photo),
      title: Text(meal.name),
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      onExpansionChanged: (exp) {},
      controller: expansionController,
      // childrenPadding: const EdgeInsets.fromLTRB(40, 0, 0, 5),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
          child: MealStyleNutrientDisplay(meal.nutrients),
        ),
        const Text(
          'Serving Size',
          style: TextStyle(fontSize: 16),
        ),
        TextFormField(
          initialValue: meal.grams.isInt
              ? meal.grams.toInt().toString()
              : roundDecimal(meal.grams.toDouble(), 3).toString(),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            border: InputBorder.none,
            // label: Center(child: Text('grams')),
            // alignLabelWithHint: true,
            // hintText: 'grams',
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
          ],
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        DropdownButton<String>(
            value: 'grams',
            items: meal.reference.altMeasures2grams.keys
                .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (String? newAltMeasure) {})
      ],
    );
  }
}

class MCTile extends StatefulWidget {
  final Function(MealComponent meal, num grams, String servingValue) onGramsChange;
  final Function(MealComponent meal) onEdit;
  final Function(MealComponent meal) onDelete;
  final MealComponent meal;
  final expansionController = ExpansionTileController();


  MCTile(this.meal,
      {Key? key,
        required this.onGramsChange,
        required this.onEdit,
        required this.onDelete})
      : super(key: key);
  // String servingValue = 'grams';

  @override
  State<MCTile> createState() => _MCTileState();
}

class _MCTileState extends State<MCTile> {
  final textController = TextEditingController();
  bool _isExpanded = false;
  String servingValue = 'grams';

  // late Nutrients _nutrientDisplay;
  _getAltMeasure(String alt) => widget.meal.reference.altMeasures2grams[alt]!;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.trailing,
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (widget.meal.reference is Meal)
          if (toBool((widget.meal.reference as Meal).notes))
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        mealNotesPopUp(widget.meal.reference as Meal, context));
              },
              icon: const Icon(Icons.info_outline),
            ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) =>
          [
            PopupMenuItem(
              value:
              MealComponentPopUpEnumHolder(widget.meal, PopUpOptions.edit),
              child: const Text('Edit'),
            ),
            PopupMenuItem(
                value: MealComponentPopUpEnumHolder(
                    widget.meal, PopUpOptions.delete),
                child: const Text('Delete')),
            PopupMenuItem(
              value: MealComponentPopUpEnumHolder(
                  widget.meal, PopUpOptions.duplicate),
              child: const Text('Duplicate'),
            ),
          ],
          onSelected: (val) {
            switch (val.popUpOption) {
              case PopUpOptions.edit:
              // TODO: Handle this case.
                break;
              case PopUpOptions.delete:
                widget.onDelete(val.mealComponent);
                break;
              case PopUpOptions.duplicate:
              // TODO: Handle this case.
                break;
            }
          },
        ),
        ExpandIcon(
            isExpanded: _isExpanded,
            onPressed: (bool currentExpansion) {
              !currentExpansion
                  ? widget.expansionController.expand()
                  : widget.expansionController.collapse();
              setState(() {
                _isExpanded = !currentExpansion;
              });
            })
      ]),
      // subtitle: nutrientText(nutrients: widget.meal.nutrients, grams: widget.meal.grams.round()),
      // subtitle: RichText(
      //   text: TextSpan(
      //     children:[
      //       TextSpan(text: 'Serving:  '),
      //       TextSpan(text: "${widget.meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "),
      //       TextSpan(text: '\u{1F525}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${widget.meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '),
      //       TextSpan(text: '\u{1F35E}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${widget.meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '),
      //       TextSpan(text: '\u{1F969}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       // '${widget.meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
      //       TextSpan(text: '${widget.meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '),
      //       TextSpan(text: '$olive  ', style: GoogleFonts.notoColorEmoji()),
      //       // '${widget.meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
      //       TextSpan(text: '${widget.meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'),
      //       TextSpan(text: '$butter  ', style: GoogleFonts.notoColorEmoji()),
      //     ]
      //   )
      // ),
      leading: GetImage(widget.meal.reference.photo),
      title: Text(widget.meal.name),
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      onExpansionChanged: (newExpState) {
        setState(() {
          _isExpanded = newExpState;
        });
      },
      controller: widget.expansionController,
      // childrenPadding: const EdgeInsets.fromLTRB(40, 0, 0, 5),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
          // child: MealStyleNutrientDisplay(widget.meal.nutrients),
          child: mealStyleNutrientDisplay(widget.meal.nutrients),
        ),
        const Text(
          'Serving Size',
          style: TextStyle(fontSize: 16),
        ),
        TextFormField(
          // initialValue: widget.meal.grams.isInt
          //     ? widget.meal.grams.toInt().toString()
          //     : roundDecimal(widget.meal.grams.toDouble(), 3).toString(),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            border: InputBorder.none,
            // label: Center(child: Text('grams')),
            // alignLabelWithHint: true,
            // hintText: 'grams',
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
          ],
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          controller: textController,
          validator: (val) =>
          val == null || val.isEmpty || val == '.'
              ? 'Required Field' : null,
          onChanged: (valString) {
            num val = fixDecimal(valString) ?? 0;
            widget.onGramsChange(widget.meal, val, servingValue);
            // TODO update meal in bloc
            setState(() {
              // widget.meal = widget.meal.reference.toMealComponent(
              //     servingValue, val, widget.meal.reference);
            });
          },
        ),
        DropdownButton<String>(
            value: servingValue,
            items: widget.meal.reference.altMeasures2grams.keys
                .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (String? newAltMeasure) {
              if (newAltMeasure == null) {
                return;
              }
              setState(() {
                final ratio = widget.meal.grams / _getAltMeasure(newAltMeasure);
                textController.text = ratio.isInt
                    ? ratio.toInt().toString()
                    : roundDecimal(ratio.toDouble(), 3).toString();
                servingValue = newAltMeasure;
              });
            })
      ],
    );
  }

  @override
  void initState() {
    textController.text = widget.meal.grams.isInt
        ? widget.meal.grams.toInt().toString()
        : roundDecimal(widget.meal.grams.toDouble(), 3).toString();
    super.initState();
  }
}
