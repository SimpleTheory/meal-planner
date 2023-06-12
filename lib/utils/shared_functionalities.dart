import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/ingredients_page/ingredients_page_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils/utils.dart';
import '../blocs/custom_ing/custom_ing_bloc.dart';
import '../blocs/meal_maker/meal_maker_bloc.dart';
import '../screens/custom_ingredient.dart';
import '../screens/ingredients_page.dart';
import '../screens/meal_maker_page.dart';
import 'local_widgets.dart';

Future<void> editIng(BuildContext context, IngredientsPageBloc bloc,
    {required MealComponentFactory ref}) async {
  if (ref is Ingredient) {
    var thing = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CustomIngBloc>(
                      create: (context) => CustomIngBloc(ref)),
                  // BlocProvider<IngredientsPageBloc>.value(value: ingPgBloc)
                ], child: const CustomIngredientPage())));
    if (thing is Ingredient) {
      bloc.add(OnSubmitSolo(thing, ingToReplace: ref));
    }
  } else if (ref is Meal) {
    var thing = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<MealMakerBloc>(
                      create: (context) => MealMakerBloc(ref)),
                  // BlocProvider<IngredientsPageBloc>.value(value: ingPgBloc)
                ], child: const MealMakerPage())));
    if (thing is Meal) {
      bloc.add(OnSubmitSolo(thing, ingToReplace: ref));
    }
  }
}

Future<void> addIng(BuildContext context, IngredientsPageBloc bloc,
    {required bool pageIsIng}) async {
  if (pageIsIng) {
    var thing = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CustomIngBloc>(
                      create: (context) => CustomIngBloc()),
                  // BlocProvider<IngredientsPageBloc>.value(value: ingPgBloc)
                ], child: const CustomIngredientPage())));
    if (thing is Ingredient) {
      bloc.add(OnSubmitSolo(thing));
    }
  } else {
    var thing = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<MealMakerBloc>(
                      create: (context) => MealMakerBloc()),
                  // BlocProvider<IngredientsPageBloc>.value(value: ingPgBloc)
                ], child: const MealMakerPage())));
    if (thing is Meal) {
      bloc.add(OnSubmitSolo(thing));
    }
  }
}

class IngredientPopUpEnumHolder {
  final MealComponentFactory ingredient;
  final PopUpOptions option;

  const IngredientPopUpEnumHolder(this.ingredient, this.option);
}

class MCFactoryTile extends StatelessWidget {
  final MealComponentFactory ingredient;

  const MCFactoryTile(this.ingredient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build ${ingredient.name}');
    final ingPgBloc = context.read<IngredientsPageBloc>();
    return ListTile(
        title: Text(ingredient.name),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.edit),
              child: const Text('Edit'),
            ),
            PopupMenuItem(
                value:
                    IngredientPopUpEnumHolder(ingredient, PopUpOptions.delete),
                child: const Text('Delete')),
            PopupMenuItem(
              value:
                  IngredientPopUpEnumHolder(ingredient, PopUpOptions.duplicate),
              child: const Text('Duplicate'),
            ),
          ],
          onSelected: (IngredientPopUpEnumHolder ing) async {
            switch (ing.option) {
              case PopUpOptions.edit:
                editIng(context, ingPgBloc, ref: ing.ingredient);
                break;
              case PopUpOptions.delete:
                ingPgBloc.add(IngDelete(ingredient));
                break;
              case PopUpOptions.duplicate:
                ingPgBloc.add(IngDuplicate(ingredient));
                break;
            }
          },
        ),
        subtitle: NutrientText(
          nutrients: ingredient.baseNutrient.nutrients,
          grams:
              ingredient is Ingredient ? ingredient.baseNutrient.grams : null,
          baseUnit: ingredient is Ingredient ? ingredient.unit : null,
        ),
        leading: GetImage(ingredient.photo,
            width: 75, height: 75, cW: 75, cH: 75, cache: true),
        onTap: () {
          if (ingPgBloc.state.backReference) {
            Navigator.pop(context, ingredient);
          }
          //else if (){}
          //else if (){}
          else {
            editIng(context, ingPgBloc, ref: ingredient);
          }
        });
  }
}

class MCFactoryTileStful extends StatefulWidget {
  final MealComponentFactory ingredient;

  const MCFactoryTileStful(this.ingredient, {super.key});

  @override
  State<MCFactoryTileStful> createState() => _MCFactoryTileStfulState();
}

class _MCFactoryTileStfulState extends State<MCFactoryTileStful>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print('build ${widget.ingredient.name}');
    final ingPgBloc = context.read<IngredientsPageBloc>();
    super.build(context);
    return ListTile(
        title: Text(widget.ingredient.name),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: IngredientPopUpEnumHolder(
                  widget.ingredient, PopUpOptions.edit),
              child: const Text('Edit'),
            ),
            PopupMenuItem(
                value: IngredientPopUpEnumHolder(
                    widget.ingredient, PopUpOptions.delete),
                child: const Text('Delete')),
            PopupMenuItem(
              value: IngredientPopUpEnumHolder(
                  widget.ingredient, PopUpOptions.duplicate),
              child: const Text('Duplicate'),
            ),
          ],
          onSelected: (IngredientPopUpEnumHolder ing) async {
            switch (ing.option) {
              case PopUpOptions.edit:
                editIng(context, ingPgBloc, ref: widget.ingredient);
                break;
              case PopUpOptions.delete:
                ingPgBloc.add(IngDelete(widget.ingredient));
                break;
              case PopUpOptions.duplicate:
                ingPgBloc.add(IngDuplicate(widget.ingredient));
                break;
            }
          },
        ),
        subtitle: NutrientText(
          nutrients: widget.ingredient.baseNutrient.nutrients,
          grams: widget.ingredient is Ingredient
              ? widget.ingredient.baseNutrient.grams
              : null,
          baseUnit:
              widget.ingredient is Ingredient ? widget.ingredient.unit : null,
        ),
        leading: GetImage(widget.ingredient.photo,
            width: 75, height: 75, cW: 75, cH: 75, cache: true),
        onTap: () {
          if (ingPgBloc.state.backReference) {
            Navigator.pop(context, widget.ingredient);
          }
          //else if (){}
          //else if (){}
          else {
            editIng(context, ingPgBloc, ref: widget.ingredient);
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}

// class MCFactoryListView extends StatefulWidget {
//   final TextEditingController searchController;
//   const MCFactoryListView({super.key, required this.searchController});
//
//   @override
//   State<MCFactoryListView> createState() => _MCFactoryListViewState();
// }
//
// class _MCFactoryListViewState extends State<MCFactoryListView> with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return CustomScrollView(
//       slivers: [
//         SliverList(
//             delegate: SliverChildListDelegate([
//                 PlusSignTile((context) {
//                 openAddNewIngredientPopUp(context);
//               })
//               ],
//               addAutomaticKeepAlives: true
//             )
//         ),
//         BlocConsumer<IngredientsPageBloc, IngredientsPageState>(
//           listener: (context, state) {
//             if (state is IngPageSuccessfulCreation) {
//               widget.searchController.text = '';
//               if (state.backReference) {
//                 Navigator.pop(context, state.ingredient);
//               }
//             }
//           },
//           builder: (context, state) {
//             // Maybe add something for if its empty
//             return SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) => MCFactoryTile(
//                     state.searchResults[index],
//                     key: Key(index.toString()),
//                   ),
//                   childCount: state.searchResults.length,
//                   addAutomaticKeepAlives: true
//                 )
//             );
//           },
//         )
//         // ...ingredients.map((e) => ingredientTile(e)),
//       ],
//     );
//   }
//
//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
// }

class MCFactoryListViewStless extends StatelessWidget {
  final bool pgIsIng;
  final TextEditingController searchController;

  const MCFactoryListViewStless(this.searchController,
      {required this.pgIsIng, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          if (pgIsIng)
            PlusSignTile((context) {
              openAddNewIngredientPopUp(context);
            }),
          if (!pgIsIng)
            PlusSignTile((_) {
              addIng(context, context.read<IngredientsPageBloc>(),
                  pageIsIng: false);
            }),
        ], addAutomaticKeepAlives: true)),
        BlocConsumer<IngredientsPageBloc, IngredientsPageState>(
          listener: (context, state) {
            if (state is IngPageSuccessfulCreation) {
              searchController.text = '';
              if (state.backReference) {
                Navigator.pop(context, state.ingredient);
              }
            }
          },
          builder: (context, state) {
            // Maybe add something for if its empty
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => MCFactoryTileStful(
                        state.searchResults[index],
                        key: ValueKey<int>(index),
                      ),
                  childCount: state.searchResults.length,
                  addAutomaticKeepAlives: true,
                  findChildIndexCallback: (Key key) {
                // Find the index of the widget with the given key
                final ValueKey<int> valueKey = key as ValueKey<int>;
                final int index = valueKey.value;
                print(index);
                return index;
              }),
            );
          },
        )
        // ...ingredients.map((e) => ingredientTile(e)),
      ],
    );
  }
}
