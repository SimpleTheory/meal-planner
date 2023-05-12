import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/domain/dri_notes.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';

import '../temp_dummy_data.dart';

class DRIConfigPage extends StatelessWidget {

  const DRIConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(diet.name)),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text(diet.name)),
            ListTile(title: const Text('Days'), onTap: () {},),
            ListTile(title: const Text('Shopping List'), onTap: () {},),
            ListTile(title: const Text('DRI Configuration'), onTap: () {},),
            ListTile(title: const Text('Return to Home Page'), onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },),
          ],
          // DrawerHeader(child: Text(),)
        ),
      ),
      body: Column(
        children: diet.dris.attributes__.values.map((e) => driForm(e as DRI, context)).toList(),
      ),
    );
  }
}

Widget driForm(DRI dri, BuildContext context) {
  List<Widget?> temp = [
    Text('${replaceTextForForm(dri.name)} (${dri.unit})'),
    Flexible(
      child: TextFormField(
        initialValue:dri.dri?.toString(),
        decoration: const InputDecoration(
          labelText: 'Daily Recommended Intake',
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
          labelText: 'Upper Tolerable Limit',
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
        ],
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
      ),
    ),
    toBool(driNotes[dri.name]) ?
    IconButton(
        onPressed: (){
          showDialog(context: context, builder: (context) => driInformation(dri.name, context));},
        icon: const Icon(Icons.help)) : null,
  ].where((e) => e!=null).toList();
  // String? stringify(num? n) => n?.toString();
  return Row(
      children: temp as List<Widget>
  );
}

AlertDialog driInformation(String driName, BuildContext context) => AlertDialog(
  title: Text('${replaceTextForForm(driName)} Notes:'),
  content: Text(driNotes[driName]!),
  actions: [TextButton(onPressed: () {Navigator.pop(context);}, child: const Text('Return'))],
);