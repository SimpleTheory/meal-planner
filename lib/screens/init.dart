import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/screens/general_settings.dart';

import '../blocs/init/init_bloc.dart';

const waiver = 'Waiver';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          ElevatedButton(onPressed: (){context.read<InitBloc>().add(LoadFileInitEvent());}, child: const Text('Restore From Back-Up')),
          ElevatedButton(onPressed: (){showDialog(context: context, builder: waiverDialog);}, child: const Text('New'))
        ],
      ),
    );
  }
}


// class GeneralSettingsPage extends StatelessWidget {
//   const GeneralSettingsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Wrap with bloc
//     return Scaffold(
//         appBar: AppBar(title: const Text('General Settings')),
//         resizeToAvoidBottomInset: false,
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       context.read<SettingsBloc>().add(Imperialify());
//                     },
//                     child: Container(
//                         padding: const EdgeInsets.all(12),
//                         child: Text('Imperial')),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.read<SettingsBloc>().add(Metricify());
//                     },
//                     child: Container(
//                         padding: const EdgeInsets.all(12),
//                         child: Text('Metric')),
//                   )
//                 ],
//               ),
//               BlocBuilder<SettingsBloc, SettingsState>(
//                 builder: (context, state) {
//                   if (state.measuringSystem == SettingsMeasuringSystem.metric) {
//                     return Row(
//                       children: [
//                         const Text('Height: '),
//                         Flexible(
//                           child: TextField(
//                               decoration: const InputDecoration(
//                                 labelText: 'centimeters',
//                               ),
//                               keyboardType: TextInputType.number,
//                               inputFormatters: <TextInputFormatter>[
//                                 FilteringTextInputFormatter.digitsOnly
//                               ]),
//                         )
//                       ],
//                     );
//                   } else {
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           children: [
//                             const Text('Feet: '),
//                             Flexible(
//                               child: TextField(
//                                   decoration: const InputDecoration(
//                                     labelText: 'feet',
//                                   ),
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: <TextInputFormatter>[
//                                     FilteringTextInputFormatter.digitsOnly
//                                   ]),
//                             ),
//                             const Text('Inches: '),
//                             Flexible(
//                               child: TextField(
//                                   decoration: const InputDecoration(
//                                     labelText: 'in',
//                                   ),
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: <TextInputFormatter>[
//                                     FilteringTextInputFormatter.digitsOnly
//                                   ]),
//                             )
//                           ],
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//               Row(
//                 children: [
//                   const Text('Weight: '),
//                   Flexible(
//                     child: BlocBuilder<SettingsBloc, SettingsState>(
//                       builder: (context, state) {
//                         return TextFormField(
//                             decoration: InputDecoration(
//                               labelText: state.measuringSystem ==
//                                   SettingsMeasuringSystem.metric
//                                   ? 'kilograms'
//                                   : 'pounds',
//                             ),
//                             keyboardType: TextInputType.number,
//                             inputFormatters: <TextInputFormatter>[
//                               FilteringTextInputFormatter.digitsOnly
//                             ]);
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               BlocBuilder<SettingsBloc, SettingsState>(
//                 builder: (context, state) {
//                   return Row(
//                     children: [
//                       const Text('Sex: '),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           padding: const EdgeInsets.all(12),
//                           child: const Text('Male'),
//                           color: Colors.green,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                             padding: const EdgeInsets.all(12),
//                             child: const Text('Female')),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//               Row(
//                 children: [Text('API Key: '), Flexible(child: TextField())],
//               ),
//               Row(
//                 children: [Text('API ID: '), Flexible(child: TextField())],
//               ),
//               Row(
//                 children: [
//                   Text('Dark mode: '),
//
//                   /// Default = settings dark mode (which will be sys pref) onChange updates settings,
//                   Switch(value: state.darkMode, onChanged: (val){}),
//                 ],
//               ),
//               Row(
//                 children: [
//                   const Text('Estimated Activity Level: '),
//                   DropdownButton<String>(
//                       value: 'Sedentary',
//                       onChanged: (String? activityLevel) {},
//                       items: <String>[
//                         'Sedentary',
//                         'Low Active',
//                         'Active',
//                         'Very Active'
//                       ]
//                           .map<DropdownMenuItem<String>>((String value) =>
//                           DropdownMenuItem<String>(
//                               value: value, child: Text(value)))
//                           .toList())
//                 ],
//               ),
//             ],
//           ).pad(const EdgeInsets.all(8.0)),
//         ));
//   }
// }



AlertDialog waiverDialog(BuildContext context)=> AlertDialog(
    content: Column(
    children: [
      const Text(waiver),
      ElevatedButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const GeneralSettingsPageInit()));
        // TODO Go to settings with null Settings
        // Make New App
      }, child: const Text('Continue'))
    ],
  )
);
