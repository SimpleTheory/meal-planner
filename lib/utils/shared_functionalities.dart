import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/ingredients_page/ingredients_page_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils/utils.dart';
import '../blocs/custom_ing/custom_ing_bloc.dart';
import '../blocs/meal_maker/meal_maker_bloc.dart';
import '../screens/custom_ingredient.dart';
import '../screens/meal_maker_page.dart';
import 'local_widgets.dart';

Future<void> editIng(BuildContext context, IngredientsPageBloc bloc, {required MealComponentFactory ref}) async {
  if (ref is Ingredient) {
    var thing = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
              BlocProvider<CustomIngBloc>(
                  create: (context) => CustomIngBloc(ref)),
              // BlocProvider<IngredientsPageBloc>.value(value: ingPgBloc)
            ], child: const CustomIngredientPage())));
    if (thing is Ingredient){
      bloc.add(OnSubmitSolo(thing, ingToReplace: ref));
    }
  }
  else if (ref is Meal){
    var thing = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
              BlocProvider<MealMakerBloc>(
                  create: (context) => MealMakerBloc(ref)),
              // BlocProvider<IngredientsPageBloc>.value(value: ingPgBloc)
            ],
                child: const MealMakerPage())));
    if (thing is Meal){
      bloc.add(OnSubmitSolo(thing, ingToReplace: ref));
    }
  }
}
Future<void> addIng(BuildContext context, IngredientsPageBloc bloc, {required bool pageIsIng}) async {
  if (pageIsIng) {
    var thing = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
              BlocProvider<CustomIngBloc>(
                  create: (context) => CustomIngBloc()),
              // BlocProvider<IngredientsPageBloc>.value(value: ingPgBloc)
            ], child: const CustomIngredientPage())));
    if (thing is Ingredient){
      bloc.add(OnSubmitSolo(thing));
    }
  }
  else{
    var thing = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
              BlocProvider<MealMakerBloc>(
                  create: (context) => MealMakerBloc()),
              // BlocProvider<IngredientsPageBloc>.value(value: ingPgBloc)
            ],
                child: const MealMakerPage())));
    if (thing is Meal){
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
                value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.delete),
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
          grams: ingredient is Ingredient ? ingredient.baseNutrient.grams : null,
          baseUnit: ingredient is Ingredient ? ingredient.unit : null,
        ),
        leading: GetImage(ingredient.photo, width: 75, cache: false),
        onTap: () {
          if (ingPgBloc.state.backReference){
            Navigator.pop(context, ingredient);
          }
          //else if (){}
          //else if (){}
          else{
            editIng(context, ingPgBloc, ref: ingredient);
          }
        }
    );
  }
}