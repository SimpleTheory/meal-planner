import 'dart:io';
import 'package:ari_utils/ari_utils.dart' as ari;
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils.dart';

/// AGG ROOT
@Dataclass()
class App {
  Settings settings;
  Map<String, Diet> diets;
  Map<String, Meal> meals;
  Map<String, Ingredient> baseIngredients;
  List<MealComponentFactory> get ingredients => [
        ...baseIngredients.values,
        ...meals.values.where((element) => element.isSubRecipe)
      ];

  void addMeal(Meal meal, {bool save = true}) {
    meals[meal.name] = meal;
    // saveMeal(meal);
    // Saver().app(this);
    if (save) {
      saveEvent([meal]);
    }
  }

  void addBaseIngredient(Ingredient ingredient, {bool save = true}) {
    baseIngredients[ingredient.name] = ingredient;
    // saveIngredient(ingredient);
    // Saver().app(this);
    if (save) {
      saveEvent([ingredient]);
    }
  }

  void addDiet(Diet diet, {bool save = true}) {
    diets[diet.name] = diet;
    // saveDietWithIsolate(diet);
    // Saver().app(this);
    if (save) {
      saveEvent([diet]);
    }
  }

  void updateBaseIngredient(Ingredient ingToUpdate, Ingredient replacer) {
    deleteBaseIngredient(ingToUpdate);
    addBaseIngredient(replacer);
  }

  void updateMeal(Meal mealToUpdate, Meal replacer) {
    deleteMeal(mealToUpdate);
    addMeal(replacer);
  }

  void deleteMeal(Meal meal, {bool save = true}) {
    meals.remove(meal.name);
    if (save) {
      saveEvent([meal]);
    }
    // deleteMealFromSave(meal);
  }

  void deleteBaseIngredient(Ingredient ingredient, {bool save = true}) {
    baseIngredients.remove(ingredient.name);
    if (save) {
      saveEvent([ingredient]);
    }
    // deleteIngredientFromSave(ingredient);
  }

  void deleteDiet(Diet diet, {bool save = true}) {
    diets.remove(diet.name);
    if (save) {
      saveEvent([diet]);
    }
    // deleteDietFromSave(diet);
  }

  void renameDiet(Diet diet, String newName) {
    deleteDiet(diet);
    diet.name = newName;
    addDiet(diet);
  }

  void reorderDiet(int oldIndex, int newIndex, {bool save = true}) {
    diets = reorderMap(diets, oldIndex, newIndex);
    if (save) {
      saveEvent([oldIndex, newIndex]);
    }
  }

  void updateSettings(Settings settings, {bool save = true}) {
    this.settings = settings.copyWithSettings(anthroMetrics: settings.anthroMetrics.copyWithAnthroMetrics());
    if (save) {
      saveEvent([settings]);
    }
  }

  factory App.newApp(Settings settings) =>
      App(settings: settings, diets: {}, meals: {}, baseIngredients: {});

  Day dayFromId(int id){
    for (Diet diet in diets.values){
      for (Day day in diet.days){
        if (day.id == id){
          return day;
        }
      }
    }
    throw ArgumentError('Day does not exist with id: $id');
  }

  void sortIngredientsAndMeals(){
    baseIngredients = baseIngredients.sort((entry) => entry.key.toLowerCase());
    meals = meals.sort((entry) => entry.key.toLowerCase());
  }

  App.dummy() :
      settings = Settings.dummy(),
      diets = {},
      meals = {},
      baseIngredients = {};

  // <editor-fold desc="Dataclass Section">

  // <editor-fold desc="Singleton Pattern">
  // static late final App _singleton;
  //
  // factory App() {
  //   return _singleton;
  // }
  //
  // App._internal({
  //   required this.settings,
  //   required this.diets,
  //   required this.meals,
  //   required this.baseIngredients,
  // });
  //
  // factory App.restart({required Settings settings}) {
  //   _singleton = App._internal(
  //       settings: settings,
  //       diets: <Diet>[],
  //       meals: <Meal>[],
  //       baseIngredients: <Ingredient>[]);
  //   return _singleton;
  // }

  // </editor-fold>

  // <editor-fold desc="Custom Data Functions">
  // App update(
  //     {Settings? settings,
  //     List<Diet>? diets,
  //     List<Meal>? meals,
  //     List<Ingredient>? baseIngredients}) {
  //   _singleton = App._internal(
  //       settings: settings ?? this.settings,
  //       diets: diets ?? this.diets,
  //       meals: meals ?? this.meals,
  //       baseIngredients: baseIngredients ?? this.baseIngredients);
  //   return _singleton;
  // }
  //
  // factory App.fromMap(Map map) {
  //   Settings settings = dejsonify(map['settings']);
  //   List dietsTemp = dejsonify(map['diets']);
  //   List mealsTemp = dejsonify(map['meals']);
  //   List baseIngredientsTemp = dejsonify(map['baseIngredients']);
  //
  //   List<Diet> diets = List<Diet>.from(dietsTemp);
  //
  //   List<Meal> meals = List<Meal>.from(mealsTemp);
  //
  //   List<Ingredient> baseIngredients =
  //       List<Ingredient>.from(baseIngredientsTemp);
  //
  //   _singleton = App._internal(
  //       settings: settings,
  //       diets: diets,
  //       meals: meals,
  //       baseIngredients: baseIngredients);
  //   return _singleton;
  // }
  // factory App.fromJson(String json) => App.fromMap(jsonDecode(json));
  // </editor-fold>

  // <editor-fold desc="Regular Dataclass Section">
  @Generate()
  // <Dataclass>

  App({
    required this.settings,
    required this.diets,
    required this.meals,
    required this.baseIngredients,
  });

  factory App.staticConstructor({
    required settings,
    required diets,
    required meals,
    required baseIngredients,
  }) =>
      App(
          settings: settings,
          diets: diets,
          meals: meals,
          baseIngredients: baseIngredients);

  Map<String, dynamic> get attributes__ => {
        "settings": settings,
        "diets": diets,
        "meals": meals,
        "baseIngredients": baseIngredients
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is App &&
          runtimeType == other.runtimeType &&
          equals(settings, other.settings) &&
          equals(diets, other.diets) &&
          equals(meals, other.meals) &&
          equals(baseIngredients, other.baseIngredients));

  @override
  int get hashCode =>
      settings.hashCode ^
      diets.hashCode ^
      meals.hashCode ^
      baseIngredients.hashCode;

  @override
  String toString() =>
      'App(settings: $settings, diets: $diets, meals: $meals, baseIngredients: $baseIngredients)';

  App copyWithApp(
          {Settings? settings,
          Map<String, Diet>? diets,
          Map<String, Meal>? meals,
          Map<String, Ingredient>? baseIngredients}) =>
      App(
          settings: settings ?? this.settings,
          diets: diets ?? this.diets,
          meals: meals ?? this.meals,
          baseIngredients: baseIngredients ?? this.baseIngredients);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'App', ...nestedJsonMap(attributes__)};

  factory App.fromJson(String json) => App.fromMap(jsonDecode(json));

  factory App.fromMap(Map map) {
    Settings settings = dejsonify(map['settings']);
    Map dietsTemp = dejsonify(map['diets']);
    Map mealsTemp = dejsonify(map['meals']);
    Map baseIngredientsTemp = dejsonify(map['baseIngredients']);

    Map<String, Diet> diets = Map<String, Diet>.from(
        dietsTemp.map((__k0, __v0) => MapEntry(__k0 as String, __v0 as Diet)));

    Map<String, Meal> meals = Map<String, Meal>.from(
        mealsTemp.map((__k0, __v0) => MapEntry(__k0 as String, __v0 as Meal)));

    Map<String, Ingredient> baseIngredients = Map<String, Ingredient>.from(
        baseIngredientsTemp
            .map((__k0, __v0) => MapEntry(__k0 as String, __v0 as Ingredient)));

    return App(
        settings: settings,
        diets: diets,
        meals: meals,
        baseIngredients: baseIngredients);
  }
  // </Dataclass>
  // </editor-fold>

  // </editor-fold>
}

/// Diet Branch

@Dataclass(constructor: false)
class Diet {
  String name;
  List<Day> days;
  DRIS dris;
  late Map<String, List<MealComponent>> shoppingList;

  Nutrients get averageNutrition {
    final trueAvg = days.where((element) => element.nutrients != zeroNut);
    if (trueAvg.isEmpty) {
      return Nutrients.zero();
    }
    final dayNut = trueAvg.map((e) => e.nutrients);
    Nutrients sum = Nutrients.sum(dayNut);
    return sum / trueAvg.length;
  }

  static Future<Diet> create(String name, Settings settings) async {
    try {
      final dris = await DRIS.fromAPI(settings.anthroMetrics);
      return Diet(name: name, days: <Day>[], dris: dris);
    } on Exception catch (_) {
      rethrow;
    }
  }

  // <editor-fold desc="Day Functions">
  void createDay({bool save = true, int? id}) {
    final newDay = Day(name: (days.length + 1).toString(), meals: [], id: id);
    days.add(newDay);
    if (save) {
      saveEvent([name, newDay.id]);
    }
  }

  void removeDay(Day day, {bool save = true}) {
    days.remove(day);
    refreshDays();
    if (save) {
      saveEvent([name, day]);
    }
  }

  void refreshDays() {
    for (int i in ari.range(days.length)) {
      days[i].name = (i + 1).toString();
    }
  }

  void reorderDay(int old, int new_, {bool save = true}) {
    days = days.reIndex(old, new_);
    refreshDays();
    if (save) {
      saveEvent([name, old, new_]);
    }
  }

  void duplicateDay(int index, {bool save = true}) {
    final duplicate = days[index].copyWithDay();
    if (index >= days.length - 1) {
      days.add(duplicate);
    } else {
      days.insert(index, duplicate);
    }
    refreshDays();
    if (save) {
      saveEvent([name, index]);
    }
  }
// </editor-fold>

  // <editor-fold desc="Shopping List Functions">
  List<MealComponent> initShoppingList() {
    List container = [];
    for (Day day in days) {
      for (MealComponent meal in day.meals) {
        container.add(meal.getBaseIngredients());
      }
    }
    List<MealComponent> flattened = flatten<MealComponent>(container).toList();
    final result = combineListValuesToMap<MealComponent, String, MealComponent>(
        flattened,
        (elemToKey) => elemToKey.name,
        (elemToValue) => elemToValue,
        (existingSameKeyValue, newSameKeyValue) =>
            existingSameKeyValue.copyWithMealComponent(
                grams: existingSameKeyValue.grams + newSameKeyValue.grams));
    return result.values.toList();
  }

  void updateShoppingList() {
    Map<MealComponent, String> currentShoppingDummy = {};
    for (MapEntry<String, List<MealComponent>> keyList in shoppingList.entries) {
      currentShoppingDummy.addAll({for (MealComponent ing in keyList.value) ing: keyList.key});
    }
    final shoppingDummyForNames = currentShoppingDummy.map((key, value) => MapEntry(key.name, value));
    // Map<String, MealComponent> namesDummy = {
    //   for (MealComponent meal in currentShoppingDummy.keys) meal.name: meal
    // };
    shoppingList = shoppingList.map((key, value) => MapEntry(key, <MealComponent>[]));

    for (MealComponent mealComponent in initShoppingList()) {
      final String? itemCategory = shoppingDummyForNames[mealComponent.name];

      // Weight is the same
      if (currentShoppingDummy.keys.contains(mealComponent)) {
        shoppingList[itemCategory!]!.add(mealComponent);
        // continue; flutter is lit broken maps lit dont work
      }

      // Item is there but the weight changed
      else if (itemCategory != null) {
        shoppingList[itemCategory]!.add(mealComponent);
        // final temp = currentShoppingDummy[namesDummy[mealComponent.name]];
        // currentShoppingDummy.remove(namesDummy[mealComponent.name]);
        // currentShoppingDummy[mealComponent] = temp!;
      }

      // Item didn't exist before
      else {
        shoppingList['Good']!.add(mealComponent);
        // currentShoppingDummy[mealComponent] = 'Good';
      }
    }
    // shoppingList = {
    //   'Good': [],
    //   'Running Low': [],
    //   'Out of Stock': [],
    //   'On the Way': []
    // };

    // for (MapEntry<MealComponent, String> entry
    //     in currentShoppingDummy.entries) {
    //   shoppingList[entry.value]?.add(entry.key);
    // }
  }

  List<MapEntry<String, List<MealComponent>>> get shoppingAsList => shoppingList.entries.toList();
  
  set shoppingAsList(List<MapEntry<String, List<MealComponent>>> lst){
    shoppingList = Map<String, List<MealComponent>>.fromEntries(lst);
  }
  
  void reIndexItem(int oldItemIndex, int oldListIndex,
    int newItemIndex, int newListIndex, {bool save=true}){
    try {
      final copy = shoppingAsList;
      final movedItem = shoppingAsList[oldListIndex].value.removeAt(oldItemIndex);
      copy[newListIndex].value.insert(newItemIndex, movedItem);
      shoppingAsList = copy;
      if (save) {
        saveEvent([name, oldItemIndex, oldListIndex, newItemIndex, newListIndex]);
      }
    } catch (e) {
      print(e);
    }
  }
  void reIndexList(int oldListIndex, int newListIndex, {bool save=true}){
    final copy = shoppingAsList;
    final movedList = copy.removeAt(oldListIndex);
    copy.insert(newListIndex, movedList);
    shoppingAsList = copy;
    if (save){
      saveEvent([name, oldListIndex, newListIndex]);
    }
  }
  void reorderWithinList(int listIndex, int oldIndex, int newIndex, {bool save=true}){
    final copy = shoppingAsList;
    final movedItem = copy[listIndex].value.removeAt(oldIndex);
    copy[listIndex].value.insert(newIndex, movedItem);
    shoppingAsList = copy;
    if (save){
      saveEvent([name, listIndex, oldIndex, newIndex]);
    }
  }
  void moveSelectedItems(String target, List<MealComponent> selected, {bool save=true}){
    // Remove Selected from all lists
    for (MapEntry<String, List<MealComponent>> entry in shoppingList.entries){
      shoppingList[entry.key] = entry.value.where((element) => !(selected.contains(element))).toList();
    }
    // Append All Selected to the end of the target
    shoppingList[target] = [...shoppingList[target]!, ...selected];
    if (save){
      saveEvent([name, target, selected]);
    }
  }

  // TODO:

  // on<SendSelectedItems>((event, emit){
  // state.moveItemsInSelected(event.target);
  // emit(state.copyWith(selected_: <MealComponent>[]));
  // });

// </editor-fold>

  updateDRIS(DRIS dris, {bool save = true}) {
    this.dris = dris;
    if (save) {
      saveEvent([name, dris]);
    }
  }

  // <editor-fold desc="Dataclass Section">
  Diet(
      {required this.name,
      required this.days,
      required this.dris,
      Map<String, List<MealComponent>>? shoppingList}) {
    this.shoppingList = shoppingList ??
        {
          'Good': initShoppingList(),
          'Running Low': [],
          'Out of Stock': [],
          'On the Way': []
        };
  }

  // <Dataclass>

  factory Diet.staticConstructor(
          {required name,
          required days,
          required dris,
          Map<String, List<MealComponent>>? shoppingList}) =>
      Diet(name: name, days: days, dris: dris, shoppingList: shoppingList);

  Map<String, dynamic> get attributes__ =>
      {"name": name, "days": days, "dris": dris, "shoppingList": shoppingList};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Diet &&
          runtimeType == other.runtimeType &&
          equals(name, other.name) &&
          equals(days, other.days) &&
          equals(dris, other.dris) &&
          equals(shoppingList, other.shoppingList));

  @override
  int get hashCode =>
      name.hashCode ^ days.hashCode ^ dris.hashCode ^ shoppingList.hashCode;

  @override
  String toString() =>
      'Diet(name: $name, days: $days, dris: $dris, shoppingList: $shoppingList)';

  Diet copyWithDiet(
          {String? name,
          List<Day>? days,
          DRIS? dris,
          Map<String, List<MealComponent>>? shoppingList}) =>
      Diet(
          name: name ?? this.name,
          days: days ?? this.days,
          dris: dris ?? this.dris,
          shoppingList: shoppingList ?? this.shoppingList);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Diet', ...nestedJsonMap(attributes__)};

  factory Diet.fromJson(String json) => Diet.fromMap(jsonDecode(json));

  factory Diet.fromMap(Map map) {
    String name = map['name'];
    List daysTemp = dejsonify(map['days']);
    DRIS dris = dejsonify(map['dris']);
    Map shoppingTemp = dejsonifyMap(map['shoppingList']);

    List<Day> days = List<Day>.from(daysTemp);
    Map<String, List<MealComponent>> shoppingList =
        Map<String, List<MealComponent>>.from(shoppingTemp.map(
            (key, value) => MapEntry(key, List<MealComponent>.from(value))));

    return Diet(name: name, days: days, dris: dris, shoppingList: shoppingList);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Day {
  String name;
  List<MealComponent> meals;
  late int id = DateTime.now().millisecondsSinceEpoch;
  Nutrients get nutrients => meals.isEmpty
      ? Nutrients.zero()
      : Nutrients.sum(meals.map((e) => e.nutrients));

  // Day saves are instituted in the Diet Bloc for the day events over there.
  // Reason being is that the bloc encloses the diet which is a necessary argument
  //  for capturing the days.

  void duplicateDayMeal(MealComponent thing2Duplicate, {bool save=true}){
    meals.add(thing2Duplicate.copyWithMealComponent());
    if (save) {
      saveEvent([id, thing2Duplicate]);
    }
  }

  void addDayMeal(Meal meal, {bool save = true}) {
    meals.add(meal.toMealComponent('serving', 1, meal));
    if (save) {
      saveEvent([id, meal]);
    }
  }

  void addDayMealFromIng(Ingredient ing, {bool save = true}) {
    meals.add(ing.toMealComponent('grams', ing.baseNutrient.grams, ing));
    if (save) {
      saveEvent([id, ing]);
    }
  }

  void deleteDayMeal(int index, {bool save = true}) {
    meals.removeAt(index);
    if (save) {
      saveEvent([id, index]);
    }
  }

  void updateMealServingSize(int index, String measure, num newAmount,
      {bool save = true}) {
    MealComponent newMeal = meals[index]
        .reference
        .toMealComponent(measure, newAmount, meals[index].reference);
    meals[index] = newMeal;
    if (save) {
      saveEvent([id, index, measure, newAmount]);
    }
  }

  void reorderMeal(int oldIndex, int newIndex, {bool save = true}) {
    meals.reIndex(oldIndex, newIndex, inPlace: true);
    if (save) {
      saveEvent([id, oldIndex, newIndex]);
    }
  }

  void replaceMealInDay(int index, MealComponent replacer, {bool save = true}) {
    meals.removeAt(index);
    try {
      meals.insert(index, replacer);
    } catch (_) {
      meals.add(replacer);
    }
    if (save) {
      saveEvent([id, index, replacer]);
    }
  }

  // <editor-fold desc="Dataclass Section">
  //@Generate()
  // <Dataclass>

  Day({
    required this.name,
    required this.meals,
    int? id
  }){if (id != null){
      this.id = id;
    }}

  factory Day.staticConstructor({
    required name,
    required meals,
    int? id
  }) =>
      Day(name: name, meals: meals);

  Map<String, dynamic> get attributes__ => {"name": name, "meals": meals, "id": id};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Day &&
          runtimeType == other.runtimeType &&
          equals(name, other.name) &&
          equals(meals, other.meals));

  @override
  int get hashCode => name.hashCode ^ meals.hashCode;

  @override
  String toString() => 'Day(name: $name, meals: $meals, id: $id)';

  Day copyWithDay({String? name, List<MealComponent>? meals}) =>
      Day(name: name ?? this.name, meals: List.from(meals ?? this.meals));

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Day', ...nestedJsonMap(attributes__)};

  factory Day.fromJson(String json) => Day.fromMap(jsonDecode(json));

  factory Day.fromMap(Map map) {
    String name = map['name'];
    List mealsTemp = dejsonify(map['meals']);
    int? id = map['id'];
    if (id == null) {
      sleep(const Duration(milliseconds: 1));
    }
    List<MealComponent> meals = List<MealComponent>.from(mealsTemp);

    return Day(name: name, meals: meals, id: id);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class MealComponent {
  // String measure;
  // num quantity;
  MealComponentFactory reference;
  num grams;
  Nutrients get nutrients {
    num ratio = grams / reference.baseNutrient.grams;
    return reference.baseNutrient.nutrients * ratio;
  }

  String get name => reference.name;

  /// Returns List<MealComponent> or itself, depending on whether this references
  /// a Meal (List) or an Ingredient (Itself). In order to recursively get all
  /// leaf nodes.
  getBaseIngredients() {
    if (reference is Ingredient) {
      return this;
    } else {
      return reference.baseIngredients();
    }
  }

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  MealComponent({
    required this.reference,
    required this.grams,
  });

  factory MealComponent.staticConstructor({
    required reference,
    required grams,
  }) =>
      MealComponent(reference: reference, grams: grams);

  Map<String, dynamic> get attributes__ =>
      {"reference": reference, "grams": grams};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealComponent &&
          runtimeType == other.runtimeType &&
          equals(reference, other.reference) &&
          equals(grams, other.grams));

  @override
  int get hashCode => reference.hashCode ^ grams.hashCode;

  @override
  String toString() => 'MealComponent(reference: $reference, grams: $grams)';

  MealComponent copyWithMealComponent(
          {MealComponentFactory? reference, num? grams}) =>
      MealComponent(
          reference: reference ?? this.reference, grams: grams ?? this.grams);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'MealComponent', ...nestedJsonMap(attributes__)};

  factory MealComponent.fromJson(String json) =>
      MealComponent.fromMap(jsonDecode(json));

  factory MealComponent.fromMap(Map map) {
    MealComponentFactory reference = dejsonify(map['reference']);
    num grams = map['grams'];

    // No casting

    return MealComponent(reference: reference, grams: grams);
  }
  // </Dataclass>

// </editor-fold>
}

final zeroNut = Nutrients.zero();
