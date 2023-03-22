import 'package:dataclasses/dataclasses.dart';


// @Dataclass()
// class Settings {
//   String
//   @Generate()
// }

@Dataclass()
class Diet {
  String name;
  DRI dri;
  List<Ingredient> shoppingList(){}
  @Generate()
}

@Dataclass()
class DRI {
  Nutrients nutrients;

  compareToNutrients(){}
  DRI subify(){}
  @Generate()
}

@Dataclass()
class Day {
  List<Meal> meals;
  int dayNumber;

  Nutrients get nutrients{}
  @Generate()
}

abstract class MealComponent{
  late var image;
  Nutrients get nutrients;
  late String name;
  late Source source;
  late double grams;
}

@Dataclass()
class Meal implements MealComponent {
  List<MealComponent> ingredients;
  int servingSize = 1;
  String name;
  var image;
  final Source source = Source.meal;
  late double grams;

  @override
  get nutrients => throw UnimplementedError();

  @Generate()
}

@Dataclass()
class BaseIngredient {
  var image;
  String name;
  Source source;
  var sourceMetadata;
  List<AltMeasure> altmeasures;

  Ingredient toIngredient(String measure, int quantity){}
  @Generate()
}

class Ingredient extends BaseIngredient implements MealComponent{
  @override
  double grams;

  @override
  Nutrients get nutrients => throw UnimplementedError();

}

@Dataclass()
class Nutrients {
  Nutrient calories;
  Nutrient unsaturatedFat;
  Nutrient saturatedFat;
  Nutrient protein;
  Nutrient carbohydrates;
  // TODO continue this list

  @Generate()
}

@Dataclass()
class Nutrient {
  int quantity;
  String unit;
  @Generate()
}

class AltMeasure{
  String name;
  int origin = 1;
  int toGrams;
}

enum Source{
  upc,
  string,
  meal,
  custom
}