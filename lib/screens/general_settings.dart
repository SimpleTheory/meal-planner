import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/settings/settings_bloc.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';


class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap with bloc
    return Scaffold(
        appBar: AppBar(title: const Text('General Settings')),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: PaddedColumn(
              edgeInsets: const EdgeInsets.all(8.0),
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Text('Imperial')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Text('Metric')),
                    )
                  ],
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    if (true) {
                      return Row(
                        children: [
                          const Text('Height: '),
                          Flexible(
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'centimeters',
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                          )
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text('Feet: '),
                              Flexible(
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'feet',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ]),
                              ),
                              const Text('Inches: '),
                              Flexible(
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'in',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ]),
                              )
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                      child: Text('Weight: '),
                    ),
                    Flexible(
                      child: BlocBuilder<SettingsBloc, SettingsState>(
                        builder: (context, state) {
                          return TextFormField(
                              decoration: const InputDecoration(
                                labelText: true ? 'kilograms' : 'pounds',
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ]);
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                      child: Text('Age: '),
                    ),
                    Flexible(
                        child: TextFormField(
                            onChanged: (val) {},
                            decoration: InputDecoration(
                              labelText: 'years',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ])),
                  ],
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        const Text('Sex: '),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: const Text('Male'),
                            color: Colors.green,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              child: const Text('Female')),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  children: [Text('API Key: '), Flexible(child: TextFormField())],
                ),
                Row(
                  children: [Text('API ID: '), Flexible(child: TextFormField())],
                ),
                Row(
                  children: [
                    Text('Dark mode: '),

                    /// Default = settings dark mode (which will be sys pref) onChange updates settings,
                    Switch(value: true, onChanged: (val) {})
                  ],
                ),
                Row(
                  children: [
                    const Text('Estimated Activity Level: '),
                    DropdownButton<String>(
                        value: 'Sedentary',
                        onChanged: (String? activityLevel) {},
                        items: <String>[
                          'Sedentary',
                          'Low Active',
                          'Active',
                          'Very Active'
                        ]
                            .map<DropdownMenuItem<String>>((String value) =>
                                DropdownMenuItem<String>(
                                    value: value, child: Text(value)))
                            .toList())
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      // final today = DateTime.now();
                      // final fileName = 'meal_planner_${today.year}_${today.month}_${today.day}.json';
                    },
                    child: const Text('Save Local Back Up'))
              ],
            ),
          ),
        ));
  }
}
