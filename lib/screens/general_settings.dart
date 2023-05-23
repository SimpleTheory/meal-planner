import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/init/settings/init_settings_bloc.dart';
import 'package:nutrition_app/blocs/settings/settings_bloc.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: Column(
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
                        child: Text('Metric')),
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
                          child: TextField(
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
                              child: TextField(
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
                              child: TextField(
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
                  const Text('Weight: '),
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
                children: [Text('API Key: '), Flexible(child: TextField())],
              ),
              Row(
                children: [Text('API ID: '), Flexible(child: TextField())],
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
            ],
          ).pad(const EdgeInsets.all(8.0)),
        ));
  }
}

class GeneralSettingsPageInit extends StatelessWidget {
  const GeneralSettingsPageInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap with bloc
    return Scaffold(
        appBar: AppBar(title: const Text('General Settings')),
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PaddedColumn(
              edgeInsets: const EdgeInsets.all(8.0),
              children: [
                ElevatedButton(
                    onPressed: () async {
                      launchUrl(Uri.parse(
                          'https://developer.nutritionix.com/signup'));
                    },
                    child: const Text(
                        'Nutrionix Sign Up (Because this app is a wrapper for their api)')),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<InitSettingsBloc>()
                            .add(MeasureUpdate(Measure.imperial));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Text('Imperial')),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<InitSettingsBloc>()
                            .add(MeasureUpdate(Measure.metric));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Text('Metric')),
                    )
                  ],
                ),
                BlocBuilder<InitSettingsBloc, InitSettingsState>(
                  builder: (context, state) {
                    if (state.measure == Measure.metric) {
                      return Row(
                        children: [
                          const Text('Height: '),
                          Flexible(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'centimeters',
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (val) {
                                context
                                    .read<InitSettingsBloc>()
                                    .add(CmUpdate(val));
                              },
                            ),
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
                                child: TextField(
                                    decoration: const InputDecoration(
                                      labelText: 'feet',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (val) {
                                      context
                                          .read<InitSettingsBloc>()
                                          .add(FeetUpdate(val));
                                    }),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Inches: '),
                              Flexible(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'in',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (val) {
                                    context
                                        .read<InitSettingsBloc>()
                                        .add(InchesUpdate(val));
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    const Text('Weight: '),
                    Flexible(
                      child: BlocBuilder<InitSettingsBloc, InitSettingsState>(
                        builder: (context, state) {
                          return TextFormField(
                              decoration: InputDecoration(
                                labelText: state.measure == Measure.metric
                                    ? 'kilograms'
                                    : 'pounds',
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
                BlocBuilder<InitSettingsBloc, InitSettingsState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        const Text('Sex: '),
                        InkWell(
                          onTap: () {
                            context
                                .read<InitSettingsBloc>()
                                .add(SexUpdate(Sex.M));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: state.sex == Sex.M ? Colors.green : null,
                            child: const Text('Male'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<InitSettingsBloc>()
                                .add(SexUpdate(Sex.F));
                          },
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              color: state.sex == Sex.F ? Colors.green : null,
                              child: const Text('Female')),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  children: [
                    const Text('API Key: '),
                    Flexible(child: TextField(
                      onChanged: (val) {
                        context.read<InitSettingsBloc>().add(ApiKeyUpdate(val));
                      },
                    ))
                  ],
                ),
                Row(
                  children: [
                    const Text('API ID: '),
                    Flexible(child: TextField(
                      onChanged: (val) {
                        context.read<InitSettingsBloc>().add(AppIdUpdate(val));
                      },
                    ))
                  ],
                ),
                Row(
                  children: [
                    const Text('Dark mode: '),

                    /// Default = settings dark mode (which will be sys pref) onChange updates settings,
                    BlocBuilder<InitSettingsBloc, InitSettingsState>(
                      builder: (context, state) {
                        return Switch(
                            value: state.darkMode,
                            onChanged: (val) {
                              context
                                  .read<InitSettingsBloc>()
                                  .add(DarkModeUpdate(val));
                            });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Estimated Activity Level: '),
                    BlocBuilder<InitSettingsBloc, InitSettingsState>(
                      builder: (context, state) {
                        return DropdownButton<Activity>(
                            value: state.activity,
                            onChanged: (Activity? act) {
                              if (act != null) {
                                context
                                    .read<InitSettingsBloc>()
                                    .add(ActivityUpdate(act));
                              }
                            },
                            items: Activity.values
                                .map<DropdownMenuItem<Activity>>(
                                    (Activity act) =>
                                        DropdownMenuItem<Activity>(
                                            value: act,
                                            child: Text(Activity.toStr(act))))
                                .toList());
                      },
                    )
                  ],
                ),
              ],
            )));
  }
}
