import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/domain/dri_notes.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/screens/diet_details_screen.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import '../temp_dummy_data.dart';

class DRIConfigPage extends StatelessWidget {

  const DRIConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(diet.name)),
      drawer: dietDrawer(diet, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            driConfigIntro,
            ...diet.dris.attributes__.values.map((e) => driForm(e as DRI, context))
          ],
        ),
      ),
    );
  }
}

Widget driForm(DRI dri, BuildContext context) {
  // String? stringify(num? n) => n?.toString();
  // print(dri.name);
  return Row(
      children: [
        Checkbox(value: dri.tracked, onChanged: (bool? changedTracked){}),
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
          child: Text('${replaceTextForForm(dri.name)} (${dri.unit})'),
        ),
        Flexible(
          child: TextFormField(
            initialValue:dri.dri?.toString(),
            decoration: const InputDecoration(
              labelText: 'DRI',
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
            ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ),
        Flexible(
          child: TextFormField(
            initialValue:dri.upperLimit?.toString(),
            decoration: const InputDecoration(
              labelText: 'UL',
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
            ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ),
        if (toBool(driNotes[dri.name])) IconButton(
            onPressed: (){
              showDialog(context: context, builder: (context) => driInformation(dri.name, context));},
            icon: const Icon(Icons.help)),
      ]
  );
}

AlertDialog driInformation(String driName, BuildContext context) => AlertDialog(
  title: Text('${replaceTextForForm(driName)}:'),
  content: Text(driNotes[driName]!),
  actions: [TextButton(onPressed: () {Navigator.pop(context);}, child: const Text('Return'))],
);

Text driConfigIntro = Text('''
Welcome to the DRI configuration page. A quick refresher on the terminology:

  DRI: Daily Recommended Intake (Always the number on the left)
  UL: Upper Tolerable Limit (Always the number on the right)
  
  
These DRIs are calculated from the NSDA website based on the anthropomorphic data in the settings. Be careful regarding what you change and what you eat. 
This App is not responsible for your health please consult a qualified dietitian before making any changes, and please double check your anthropomorphic data before making any diets (as his is what the NSDA website uses to determine your DRIs).

The DRIs are diet specific so what you change here will only affect (diet.name).

The checkbox indicates you tracking that nutrient; any nutrient with a tick will be shown in the comprehensive Nutrients, whereas those that are unchecked will be omitted.

If a field is empty that means that nutrient doesnt have that field, (IE an empty DRI means there is no daily recommended intake for that nutrient by default)  
You can also leave things blank to remove their DRI or UL.

You can click the ? icon to see more information about any specific nutrient that has it.

'''.trim());