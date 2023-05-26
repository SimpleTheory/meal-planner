import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/dri_config/dri_config_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/domain/dri_notes.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import '../blocs/diet/diet_bloc.dart';

class DRIConfigPage extends StatelessWidget {
  final Diet diet;
  late final List<DRI> dris = List<DRI>.from(diet.dris.attributes__.values);

  DRIConfigPage(this.diet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriConfigBloc(diet),
      child: Scaffold(
        appBar: AppBar(title: Text(diet.name)),
        drawer: DietDrawer(diet),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       driConfigIntro,
        //       ...diet.dris.attributes__.values.map((e) => driForm(e as DRI, context))
        //     ],
        //   ),
        // ),
        body: BlocListener<DriConfigBloc, DriConfigState>(
          listener: (context, state) {
            if (state is DRISuccessfulUpdate){
              // refreshDiet(context);
            }
          },
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                DriForm(dris[index]),
            itemCount: diet.dris.attributes__.length,
            // children: [
            //   driConfigIntro,
            //   ...diet.dris.attributes__.values.map((e) => driForm(e as DRI, context))
            // ],
          ),
        ),
      ),
    );
  }
}

/// change driForm to be a stless widget
/// Move the map code into an init state of bloc
/// Use ListView with lazyloader

class DriForm extends StatelessWidget {
  final DRI dri;

  const DriForm(this.dri, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      BlocBuilder<DriConfigBloc, DriConfigState>(
        builder: (context, state) {
          return Checkbox(
              value: dri.tracked,
              onChanged: (bool? changedTracked) {
                if (changedTracked is bool) {
                  context
                      .read<DriConfigBloc>()
                      .add(DRIActivation(changedTracked, dri));
                  // refreshDiet(context);
                }
              });
        },
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
        child: Text('${replaceTextForForm(dri.name)} (${dri.unit})'),
      ),
      Flexible(
        child: BlocBuilder<DriConfigBloc, DriConfigState>(
          builder: (context, state) {
            return TextFormField(
              onChanged: (val) {
                context
                    .read<DriConfigBloc>()
                    .add(DRIUpdate(dft: DFT.dri, dri: dri, newVal: val));
              },
              initialValue: dri.dri?.toString(),
              decoration: InputDecoration(
                  labelText: 'DRI',
                  errorText: toBool(state.driErrors[dri])
                      ? 'The DRI (${dri.dri}) must be lower than the UL (${dri
                      .upperLimit})!'
                      : null),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
              ],
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
            );
          },
        ),
      ),
      Flexible(
        child: BlocBuilder<DriConfigBloc, DriConfigState>(
          builder: (context, state) {
            return TextFormField(
              initialValue: dri.upperLimit?.toString(),
              onChanged: (val) {
                context
                    .read<DriConfigBloc>()
                    .add(DRIUpdate(dft: DFT.ul, dri: dri, newVal: val));
              },
              decoration: InputDecoration(
                errorText: toBool(state.driErrors[dri])
                    ? 'UL (${dri.upperLimit}) Must Be Higher than the DRI (${dri
                    .dri})!'
                    : null,
                labelText: 'UL',
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
              ],
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
            );
          },
        ),
      ),
      if (toBool(driNotes[dri.name]))
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => driInformation(dri.name, context));
            },
            icon: const Icon(Icons.help)),
    ]);
  }
}

// Widget driForm(DRI dri, BuildContext context) {
//   // String? stringify(num? n) => n?.toString();
//   // print(dri.name);
//   return Row(
//       children: [
//         Checkbox(value: dri.tracked, onChanged: (bool? changedTracked){}),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
//           child: Text('${replaceTextForForm(dri.name)} (${dri.unit})'),
//         ),
//         Flexible(
//           child: TextFormField(
//             initialValue:dri.dri?.toString(),
//             decoration: const InputDecoration(
//               labelText: 'DRI',
//             ),
//             inputFormatters: <TextInputFormatter>[
//               FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
//             ],
//             keyboardType: const TextInputType.numberWithOptions(decimal: true),
//           ),
//         ),
//         Flexible(
//           child: TextFormField(
//             initialValue:dri.upperLimit?.toString(),
//             decoration: const InputDecoration(
//               labelText: 'UL',
//             ),
//             inputFormatters: <TextInputFormatter>[
//               FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
//             ],
//             keyboardType: const TextInputType.numberWithOptions(decimal: true),
//           ),
//         ),
//         if (toBool(driNotes[dri.name])) IconButton(
//             onPressed: (){
//               showDialog(context: context, builder: (context) => driInformation(dri.name, context));},
//             icon: const Icon(Icons.help)),
//       ]
//   );
// }

AlertDialog driInformation(String driName, BuildContext context) =>
    AlertDialog(
      title: Text('${replaceTextForForm(driName)}:'),
      content: Text(driNotes[driName]!),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Return'))
      ],
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

'''
    .trim());
