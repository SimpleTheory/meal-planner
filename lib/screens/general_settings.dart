import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/utils/utils.dart';


class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap with bloc
    return Scaffold(
        appBar: AppBar(title: const Text('General Settings')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Text('Imperial')),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Text('Metric')),
                  )
                ],
              ),
              Row(
                children: [
                  Text('Height: '),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'centimeters',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ]
                    ),
                  )
                  ],
              ),
              Row(
                children: [
                  Text('Weight: '),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'kilograms',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ]
                    ),
                  )
                  ],
              ),
              Row(
                children: [
                  Text('Sex: '),
                  InkWell(
                    onTap: (){},
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Text('Male')),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Text('Female')),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('API Key: '),
                  Flexible(child: TextField())
                ],
              ),
              Row(
                children: [
                  Text('API ID: '),
                  Flexible(child: TextField())
                ],
              ),
              Row(
                children: [
                  Text('Dark mode: '),
                  /// Default = settings dark mode (which will be sys pref) onChange updates settings,
                  Switch(value: true, onChanged: (val)=>!val),
                ],
              ),
              Row(
                children: [
                  Text('Estimated Activity Level: '),
                  DropdownButton<String>(
                    value: 'Sedentary',
                    onChanged: (String? activityLevel) {},
                    items: <String>['Sedentary', 'Low Active', 'Active', 'Very Active'].map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList())
                ],
              ),
            ],
          ).pad(const EdgeInsets.all(8.0)),
        )
    );
  }
}