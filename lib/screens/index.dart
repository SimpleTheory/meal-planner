import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nutrition_app/blocs/diet/diet_bloc.dart';
import 'package:nutrition_app/blocs/ingredients_page/ingredients_page_bloc.dart';
import 'package:nutrition_app/blocs/settings/settings_bloc.dart';
import 'package:nutrition_app/screens/diet_details_screen.dart';
import 'package:nutrition_app/screens/general_settings.dart';
import 'package:nutrition_app/screens/ingredients_page.dart';
import 'package:nutrition_app/screens/meal_page.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils.dart';
import 'package:nutrition_app/blocs/init/init_bloc.dart';
import '../blocs/index/index_bloc.dart';
import '../blocs/micro_blocs/saver.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexBloc = context.read<IndexBloc>();
    // Wrap with bloc
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition App'),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 8, 8),
              child: IconButton(
                icon: const Icon(CupertinoIcons.gear),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GeneralSettingsPage(
                              context.read<InitBloc>().state.app!.settings)));
                },
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('Diets'),
              children: [
                PlusSignTile((_) async {
                  String? val = await showDialog(
                      context: context,
                      builder: (context) => nameAThing(
                            context,
                            title: 'New Diet Name',
                          ));
                  if (val != null) {
                    indexBloc.add(AddDiet(val));
                  }
                }),
                BlocConsumer<IndexBloc, IndexState>(
                  listener: (context, state) {
                    if (state is FailedToLoadDiet) {
                      showErrorMessage(
                          context, 'Failed to load Diet!\n${state.errMessage}');
                    }
                  },
                  builder: (context, state) {
                    return ReorderableListView.builder(
                      itemBuilder: (context, index) =>
                          DietTile(state.app.diets.values.toList()[index]),
                      itemCount: state.app.diets.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      onReorder: (int oldIndex, int newIndex) {
                        context.read<IndexBloc>().add(ReorderDiet(
                            oldIndex: oldIndex, newIndex: newIndex));
                      },
                    );
                  },
                ),
                // DietTile(diet)
              ],
            ),
            ElevatedButton(
              // title: Text('Meals'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => IngredientsPageBloc(
                                  context.read<InitBloc>().state.app!,
                                  MCFTypes.meal),
                              child: MealPage(),
                            )));
              },
              child: const Text('Meals'),
              // children: [
              // ],
            ),
            ElevatedButton(
              // title: Text('Meals'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        settings: const RouteSettings(name: "/IngredientsPage"),
                        builder: (_) => BlocProvider(
                            create: (context) => IngredientsPageBloc(
                                context.read<InitBloc>().state.app!,
                                MCFTypes.ingredient),
                            child: IngredientPage())));
              },
              child: const Text('Ingredients'),
              // children: [
              // ],
            ),
            BlocListener<SaverBloc, SaverState>(
              listener: (context, state) {
                if (Saver.messageIsApp(state.message)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('The app has been saved!'),
                    backgroundColor: Colors.green,
                  ));
                }
              },
              child: ElevatedButton(
                  onPressed: () {
                    // Saver()
                    //     .app(context.read<InitBloc>().state.app!)
                    //     .then((value) {
                    //   if (!value) {
                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(const SnackBar(
                    //       content: Text('A save is currently running!'),
                    //       backgroundColor: Colors.orange,
                    //     ));
                    //   }
                    // });
                    Saver().app(context.read<InitBloc>().state.app!).whenComplete(() =>
                        Hive.openBox('tempLog').then((value) =>
                            value.deleteFromDisk()).whenComplete(() =>
                              Hive.openBox('tempLog')
                        )
                    );
                  },
                  child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}

class DietPopUpEnumHolder {
  Diet diet;
  PopUpOptions popUpOptions;

  DietPopUpEnumHolder(this.diet, this.popUpOptions);
}

// Widget dietTile(Diet diet, BuildContext context) =>
//     ListTile(
//       title: Text(diet.name),
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => DietPage(diet: diet)));
//       },
//       trailing: PopupMenuButton(
//         // onSelected: (dietPopUpSelection){},
//         itemBuilder: (BuildContext context) => [
//           PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.edit),child: const Text('Edit'),),
//           PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.delete), child: const Text('Delete')),
//           PopupMenuItem(value: DietPopUpEnumHolder(diet, PopUpOptions.duplicate),child: const Text('Duplicate'),),
//         ],
//       )
//     );

class DietTile extends StatelessWidget {
  final Diet diet;

  DietTile(this.diet, {Key? key})
      : super(
            key: key ??
                KeyHolder(value1: 'Index Diet Tiles: ', value2: diet).key());

  @override
  Widget build(BuildContext context) {
    final indexBloc = context.read<IndexBloc>();
    return ListTile(
        title: Text(diet.name),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => DietBloc(diet),
                        child: DietPage(diet),
                      )));
        },
        trailing: PopupMenuButton(
          onSelected: (DietPopUpEnumHolder dietPopUpSelection) async {
            switch (dietPopUpSelection.popUpOptions) {
              case PopUpOptions.edit:
                String? val = await showDialog(
                    context: context,
                    builder: (context) => nameAThing(
                          context,
                          title: 'Rename Diet (from ${diet.name})',
                        ));
                if (val != null) {
                  indexBloc.add(RenameDiet(diet: diet, newName: val));
                }
                break;
              case PopUpOptions.delete:
                showDialog(
                    context: context,
                    builder: (context) => deleteConfirmation(
                        onSubmit: (context) {
                          context.read<IndexBloc>().add(DeleteDiet(diet));
                        },
                        obj: diet.name,
                        context: context));
                break;
              case PopUpOptions.duplicate:
                context.read<IndexBloc>().add(DuplicateDiet(diet));
                break;
            }
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: DietPopUpEnumHolder(diet, PopUpOptions.edit),
              child: const Text('Rename'),
            ),
            PopupMenuItem(
                value: DietPopUpEnumHolder(diet, PopUpOptions.delete),
                child: const Text('Delete')),
            PopupMenuItem(
              value: DietPopUpEnumHolder(diet, PopUpOptions.duplicate),
              child: const Text('Duplicate'),
            ),
          ],
        ));
  }
}
