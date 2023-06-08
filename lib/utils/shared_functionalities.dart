import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/ingredients_page/ingredients_page_bloc.dart';
import 'package:nutrition_app/domain.dart';
import '../blocs/custom_ing/custom_ing_bloc.dart';
import '../blocs/meal_maker/meal_maker_bloc.dart';
import '../screens/custom_ingredient.dart';
import '../screens/meal_maker_page.dart';

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