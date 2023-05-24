import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/settings/settings_bloc.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';

import '../blocs/init/init_bloc.dart';

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
                      onTap: () {
                        context
                            .read<SettingsBloc>()
                            .add(MeasureUpdate(Measure.imperial));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Text('Imperial')),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<SettingsBloc>()
                            .add(MeasureUpdate(Measure.metric));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Text('Metric')),
                    )
                  ],
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    if (state.settings.measure == Measure.metric) {
                      return Row(
                        children: [
                          const Text('Height: '),
                          Flexible(
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'centimeters',
                                ),
                                onChanged: (val) {
                                  context
                                      .read<SettingsBloc>()
                                      .add(CmUpdate(val));
                                },
                                initialValue:
                                state.settings.anthroMetrics.cm.toString(),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                          )
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          const Text('Feet: '),
                          Flexible(
                            child: TextFormField(
                                onChanged: (val) {
                                  context
                                      .read<SettingsBloc>()
                                      .add(FeetUpdate(val));
                                },
                                initialValue: state.settings.anthroMetrics.feet
                                    .toString(),
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
                                initialValue: state
                                    .settings.anthroMetrics.inches
                                    .toString(),
                                onChanged: (val) {
                                  context
                                      .read<SettingsBloc>()
                                      .add(InchesUpdate(val));
                                },
                                decoration: const InputDecoration(
                                  labelText: 'in',
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^1[012]|^\d')
                                  )
                                ]),
                          )
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
                              initialValue: state.settings.measure ==
                                  Measure.imperial
                                  ? state.settings.anthroMetrics.weight
                                  .toString()
                                  : state.settings.anthroMetrics.kg.toString(),
                              onChanged: (val) {
                                if (state.settings.measure == Measure.metric) {
                                  context
                                      .read<SettingsBloc>()
                                      .add(KgUpdate(val));
                                } else {
                                  context
                                      .read<SettingsBloc>()
                                      .add(WeightUpdate(val));
                                }
                              },
                              decoration: InputDecoration(
                                labelText:
                                state.settings.measure == Measure.metric
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
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                      child: Text('Age: '),
                    ),
                    Flexible(child: BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return TextFormField(
                            onChanged: (val) {
                              context.read<SettingsBloc>().add(AgeUpdate(val));
                            },
                            initialValue:
                            state.settings.anthroMetrics.age.toString(),
                            decoration: const InputDecoration(
                              labelText: 'years',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ]);
                      },
                    )),
                  ],
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        const Text('Sex: '),
                        InkWell(
                          onTap: () {
                            context.read<SettingsBloc>().add(SexUpdate(Sex.M));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: state.settings.anthroMetrics.sex == Sex.M
                                ? Colors.green
                                : null,
                            child: const Text('Male'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<SettingsBloc>().add(SexUpdate(Sex.F));
                          },
                          child: Container(
                              color: state.settings.anthroMetrics.sex == Sex.F
                                  ? Colors.green
                                  : null,
                              padding: const EdgeInsets.all(12),
                              child: const Text('Female')),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  children: [
                    const Text('API Key: '),
                    Flexible(child: BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return TextFormField(
                          initialValue: state.settings.apikey
                              .toString(),
                          onChanged: (val) {
                            context.read<SettingsBloc>().add(ApiKeyUpdate(val));
                          },
                        );
                      },
                    ))
                  ],
                ),
                Row(
                  children: [
                    const Text('API ID: '),
                    Flexible(child: BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return TextFormField(
                          initialValue: state.settings.appId.toString(),
                          onChanged: (val) {
                            context.read<SettingsBloc>().add(AppIdUpdate(val));
                          },
                        );
                      },
                    ))
                  ],
                ),
                Row(
                  children: [
                    const Text('Dark mode: '),

                    /// Default = settings dark mode (which will be sys pref) onChange updates settings,
                    BlocConsumer<SettingsBloc, SettingsState>(
                      listener: (context, state) {
                        if (state is SettingsStateDarkModeUpdate) {
                          context.read<InitBloc>().add(ReloadApp());
                        }
                      },
                      builder: (context, state) {
                        return Switch(
                            value: state.settings.darkMode,
                            onChanged: (bool val) {
                              context
                                  .read<SettingsBloc>()
                                  .add(DarkModeUpdate(val));
                            });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text('Estimated Activity Level: '),
                    BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return DropdownButton<Activity>(
                            value: state.settings.anthroMetrics.activity,
                            onChanged: (Activity? act) {
                              if (act != null) {
                                context
                                    .read<SettingsBloc>()
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
                ElevatedButton(
                    onPressed: () {
                      // TODO Local Back Up System
                      // final today = DateTime.now();
                      // final fileName = 'meal_planner_${today.year}_${today.month}_${today.day}.json';
                    },
                    child: const Text('Save Local Back Up')),
                // TODO Way to factory reset app
              ],
            ),
          ),
        ));
  }
}
