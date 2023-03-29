import 'package:nutrition_app/domain/gen.dart';
import 'package:nutrition_app/domain/individual_nutrients.dart';
import 'package:nutrition_app/domain/dataclasses.dart';
import 'individual_nutrients.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import '../domain_2.dart';

List<ReflectedClass> dataclasses = [
  ReflectedClass(
      name: 'Diet',
      referenceType: ReflectedType.create(Diet, 'Diet'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create('name', ReflectedType.create(String, 'String'), false,
            false, false, false, false, null),
        Attribute.create('dri', ReflectedType.create(DRI, 'DRI'), false, false,
            false, false, false, null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false),
        Getter.create(
            ReflectedType.create(int, 'int'), 'hashCode', false, false)
      ],
      methods: [
        Method.create(
            'shoppingList',
            ReflectedType.create(List, 'List<Ingredient>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('Diet', ReflectedType.create(Diet, 'Diet'),
            MethodType.constructor, false, null, false, null),
        Method.create('staticConstructor', ReflectedType.create(Diet, 'Diet'),
            MethodType.factory, false, null, false, Diet.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create('copyWithDiet', ReflectedType.create(Diet, 'Diet'),
            MethodType.normal, false, null, false, null),
        Method.create('toJson', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'toMap',
            ReflectedType.create(Map, 'Map<String, dynamic?>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromJson', ReflectedType.create(Diet, 'Diet'),
            MethodType.factory, false, null, false, Diet.fromJson),
        Method.create('fromMap', ReflectedType.create(Diet, 'Diet'),
            MethodType.factory, false, null, false, Diet.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Nutrients',
      referenceType: ReflectedType.create(Nutrients, 'Nutrients'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create('calcium', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create(
            'carbohydrate',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'cholesterol',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('calories', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create(
            'saturatedFat',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('totalFat', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('transFat', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('iron', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('fiber', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create(
            'potassium',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('sodium', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('protein', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('sugars', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('choline', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('copper', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('ala', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create(
            'linoleicAcid',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('epa', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('dpa', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('dha', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('folate', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create(
            'magnesium',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'manganese',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('niacin', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create(
            'phosphorus',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'pantothenicAcid',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'riboflavin',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('selenium', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('thiamin', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('vitaminE', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('vitaminA', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create(
            'vitaminB12',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'vitaminB6',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('vitaminC', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('vitaminD', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('vitaminK', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create('zinc', ReflectedType.create(Nutrient, 'Nutrient'),
            true, false, false, false, false, null),
        Attribute.create(
            'unsaturatedFat',
            ReflectedType.create(Nutrient, 'Nutrient'),
            true,
            false,
            false,
            true,
            false,
            null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false),
        Getter.create(
            ReflectedType.create(int, 'int'), 'hashCode', false, false)
      ],
      methods: [
        Method.create('+', ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.operator, false, null, false, null),
        Method.create('-', ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.operator, false, null, false, null),
        Method.create('*', ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.operator, false, null, false, null),
        Method.create('/', ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.operator, false, null, false, null),
        Method.create('Nutrients', ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.constructor, false, null, false, null),
        Method.create(
            'staticConstructor',
            ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.factory,
            false,
            null,
            false,
            Nutrients.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'copyWithNutrients',
            ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('toJson', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'toMap',
            ReflectedType.create(Map, 'Map<String, dynamic?>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromJson', ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.factory, false, null, false, Nutrients.fromJson),
        Method.create('fromMap', ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.factory, false, null, false, Nutrients.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Ingredient',
      referenceType: ReflectedType.create(Ingredient, 'Ingredient'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create('grams', ReflectedType.create(num, 'num'), false,
            false, false, false, false, null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Nutrients, 'Nutrients'), 'nutrients',
            false, false)
      ],
      methods: [
        Method.create(
            'Ingredient',
            ReflectedType.create(Ingredient, 'Ingredient'),
            MethodType.constructor,
            false,
            null,
            false,
            null)
      ],
      parent: BaseIngredient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Meal',
      referenceType: ReflectedType.create(Meal, 'Meal'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create(
            'ingredients',
            ReflectedType.create(List, 'List<MealComponent>'),
            false,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('servingSize', ReflectedType.create(int, 'int'), false,
            false, false, false, false, 1),
        Attribute.create('name', ReflectedType.create(String, 'String'), false,
            false, false, false, false, null),
        Attribute.create('image', ReflectedType.create(dynamic, 'dynamic?'),
            false, false, false, false, false, null),
        Attribute.create('source', ReflectedType.create(Source, 'Source'), true,
            false, false, false, false, Source.meal),
        Attribute.create('grams', ReflectedType.create(num, 'num'), false,
            false, false, true, false, null)
      ],
      getters: [
        Getter.create(ReflectedType.create(dynamic, 'dynamic?'), 'nutrients',
            false, false),
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false),
        Getter.create(
            ReflectedType.create(int, 'int'), 'hashCode', false, false)
      ],
      methods: [
        Method.create('Meal', ReflectedType.create(Meal, 'Meal'),
            MethodType.constructor, false, null, false, null),
        Method.create('staticConstructor', ReflectedType.create(Meal, 'Meal'),
            MethodType.factory, false, null, false, Meal.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create('copyWithMeal', ReflectedType.create(Meal, 'Meal'),
            MethodType.normal, false, null, false, null),
        Method.create('toJson', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'toMap',
            ReflectedType.create(Map, 'Map<String, dynamic?>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromJson', ReflectedType.create(Meal, 'Meal'),
            MethodType.factory, false, null, false, Meal.fromJson),
        Method.create('fromMap', ReflectedType.create(Meal, 'Meal'),
            MethodType.factory, false, null, false, Meal.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Day',
      referenceType: ReflectedType.create(Day, 'Day'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create('meals', ReflectedType.create(List, 'List<Meal>'),
            false, false, false, false, false, null),
        Attribute.create('dayNumber', ReflectedType.create(int, 'int'), false,
            false, false, false, false, null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Nutrients, 'Nutrients'), 'nutrients',
            false, false),
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false),
        Getter.create(
            ReflectedType.create(int, 'int'), 'hashCode', false, false)
      ],
      methods: [
        Method.create('Day', ReflectedType.create(Day, 'Day'),
            MethodType.constructor, false, null, false, null),
        Method.create('staticConstructor', ReflectedType.create(Day, 'Day'),
            MethodType.factory, false, null, false, Day.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create('copyWithDay', ReflectedType.create(Day, 'Day'),
            MethodType.normal, false, null, false, null),
        Method.create('toJson', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'toMap',
            ReflectedType.create(Map, 'Map<String, dynamic?>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromJson', ReflectedType.create(Day, 'Day'),
            MethodType.factory, false, null, false, Day.fromJson),
        Method.create('fromMap', ReflectedType.create(Day, 'Day'),
            MethodType.factory, false, null, false, Day.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'MealComponent',
      referenceType: ReflectedType.create(MealComponent, 'MealComponent'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create(
            'reference',
            ReflectedType.create(MealComponentFactory, 'MealComponentFactory'),
            false,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('grams', ReflectedType.create(int, 'int'), false,
            false, false, false, false, null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Nutrients, 'Nutrients'), 'nutrients',
            false, false),
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false),
        Getter.create(
            ReflectedType.create(int, 'int'), 'hashCode', false, false)
      ],
      methods: [
        Method.create(
            'MealComponent',
            ReflectedType.create(MealComponent, 'MealComponent'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'staticConstructor',
            ReflectedType.create(MealComponent, 'MealComponent'),
            MethodType.factory,
            false,
            null,
            false,
            MealComponent.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'copyWithMealComponent',
            ReflectedType.create(MealComponent, 'MealComponent'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('toJson', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'toMap',
            ReflectedType.create(Map, 'Map<String, dynamic?>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'fromJson',
            ReflectedType.create(MealComponent, 'MealComponent'),
            MethodType.factory,
            false,
            null,
            false,
            MealComponent.fromJson),
        Method.create(
            'fromMap',
            ReflectedType.create(MealComponent, 'MealComponent'),
            MethodType.factory,
            false,
            null,
            false,
            MealComponent.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'DRI',
      referenceType: ReflectedType.create(DRI, 'DRI'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create(
            'nutrients',
            ReflectedType.create(Nutrients, 'Nutrients'),
            false,
            false,
            false,
            false,
            false,
            null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false),
        Getter.create(
            ReflectedType.create(int, 'int'), 'hashCode', false, false)
      ],
      methods: [
        Method.create(
            'compareToNutrients',
            ReflectedType.create(dynamic, 'dynamic?'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('subify', ReflectedType.create(DRI, 'DRI'),
            MethodType.normal, false, null, false, null),
        Method.create('DRI', ReflectedType.create(DRI, 'DRI'),
            MethodType.constructor, false, null, false, null),
        Method.create('staticConstructor', ReflectedType.create(DRI, 'DRI'),
            MethodType.factory, false, null, false, DRI.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create('copyWithDRI', ReflectedType.create(DRI, 'DRI'),
            MethodType.normal, false, null, false, null),
        Method.create('toJson', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'toMap',
            ReflectedType.create(Map, 'Map<String, dynamic?>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromJson', ReflectedType.create(DRI, 'DRI'),
            MethodType.factory, false, null, false, DRI.fromJson),
        Method.create('fromMap', ReflectedType.create(DRI, 'DRI'),
            MethodType.factory, false, null, false, DRI.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'BaseIngredient',
      referenceType: ReflectedType.create(BaseIngredient, 'BaseIngredient'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create('image', ReflectedType.create(dynamic, 'dynamic?'),
            false, false, false, false, false, null),
        Attribute.create('name', ReflectedType.create(String, 'String'), false,
            false, false, false, false, null),
        Attribute.create('source', ReflectedType.create(Source, 'Source'),
            false, false, false, false, false, null),
        Attribute.create(
            'sourceMetadata',
            ReflectedType.create(dynamic, 'dynamic?'),
            false,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'altMeasures',
            ReflectedType.create(List, 'List<AltMeasure>'),
            false,
            false,
            false,
            false,
            false,
            null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false),
        Getter.create(
            ReflectedType.create(int, 'int'), 'hashCode', false, false)
      ],
      methods: [
        Method.create(
            'toIngredient',
            ReflectedType.create(Ingredient, 'Ingredient'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'BaseIngredient',
            ReflectedType.create(BaseIngredient, 'BaseIngredient'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'staticConstructor',
            ReflectedType.create(BaseIngredient, 'BaseIngredient'),
            MethodType.factory,
            false,
            null,
            false,
            BaseIngredient.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'copyWithBaseIngredient',
            ReflectedType.create(BaseIngredient, 'BaseIngredient'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('toJson', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'toMap',
            ReflectedType.create(Map, 'Map<String, dynamic?>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'fromJson',
            ReflectedType.create(BaseIngredient, 'BaseIngredient'),
            MethodType.factory,
            false,
            null,
            false,
            BaseIngredient.fromJson),
        Method.create(
            'fromMap',
            ReflectedType.create(BaseIngredient, 'BaseIngredient'),
            MethodType.factory,
            false,
            null,
            false,
            BaseIngredient.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Nutrient',
      referenceType: ReflectedType.create(Nutrient, 'Nutrient'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'constructor': 'false', 'copyWith': 'false', 'toStr': 'false'}),
      attributes: [
        Attribute.create('value', ReflectedType.create(num, 'num'), true, false,
            false, false, false, null),
        Attribute.create('apiId', ReflectedType.create(int, 'int?'), true,
            false, false, false, false, null),
        Attribute.create('unit', ReflectedType.create(String, 'String'), true,
            false, false, false, false, null),
        Attribute.create('name', ReflectedType.create(String, 'String'), true,
            false, false, false, false, null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false),
        Getter.create(
            ReflectedType.create(int, 'int'), 'hashCode', false, false)
      ],
      methods: [
        Method.create('checkIfSame', ReflectedType.create(bool, 'bool'),
            MethodType.normal, false, null, false, null),
        Method.create('error', ReflectedType.create(null, 'void'),
            MethodType.normal, false, null, false, null),
        Method.create('errorCheck', ReflectedType.create(null, 'void'),
            MethodType.normal, false, null, false, null),
        Method.create('+', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.operator, false, null, false, null),
        Method.create('-', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.operator, false, null, false, null),
        Method.create('*', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.operator, false, null, false, null),
        Method.create('/', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.normal, false, null, false, null),
        Method.create('Nutrient', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.constructor, false, null, false, null),
        Method.create('Calcium', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Calcium),
        Method.create(
            'Carbohydrate',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.Carbohydrate),
        Method.create(
            'Cholesterol',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.Cholesterol),
        Method.create('Calories', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Calories),
        Method.create(
            'SaturatedFat',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.SaturatedFat),
        Method.create('TotalFat', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.TotalFat),
        Method.create('TransFat', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.TransFat),
        Method.create('Iron', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Iron),
        Method.create('Fiber', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Fiber),
        Method.create(
            'Potassium',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.Potassium),
        Method.create('Sodium', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Sodium),
        Method.create('Protein', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Protein),
        Method.create('Sugars', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Sugars),
        Method.create('Choline', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Choline),
        Method.create('Copper', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Copper),
        Method.create('ALA', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.ALA),
        Method.create(
            'LinoleicAcid',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.LinoleicAcid),
        Method.create('EPA', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.EPA),
        Method.create('DPA', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.DPA),
        Method.create('DHA', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.DHA),
        Method.create('Folate', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Folate),
        Method.create(
            'Magnesium',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.Magnesium),
        Method.create(
            'Manganese',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.Manganese),
        Method.create('Niacin', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Niacin),
        Method.create(
            'Phosphorus',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.Phosphorus),
        Method.create(
            'PantothenicAcid',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.PantothenicAcid),
        Method.create(
            'Riboflavin',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.Riboflavin),
        Method.create('Selenium', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Selenium),
        Method.create('Thiamin', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Thiamin),
        Method.create('VitaminE', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.VitaminE),
        Method.create('VitaminA', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.VitaminA),
        Method.create(
            'VitaminB12',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.VitaminB12),
        Method.create(
            'VitaminB6',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.VitaminB6),
        Method.create('VitaminC', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.VitaminC),
        Method.create('VitaminD', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.VitaminD),
        Method.create('VitaminK', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.VitaminK),
        Method.create('Zinc', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor, false, null, false, Nutrient.Zinc),
        Method.create(
            'UnsaturatedFat',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.namedConstructor,
            false,
            null,
            false,
            Nutrient.UnsaturatedFat),
        Method.create(
            'staticConstructor',
            ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.factory,
            false,
            null,
            false,
            Nutrient.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toJson', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'toMap',
            ReflectedType.create(Map, 'Map<String, dynamic?>'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromJson', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.factory, false, null, false, Nutrient.fromJson),
        Method.create('fromMap', ReflectedType.create(Nutrient, 'Nutrient'),
            MethodType.factory, false, null, false, Nutrient.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null)
];
List<EnumExtension> enumExtensions = [
  EnumExtension(
      name: 'Source',
      referenceType: ReflectedType.create(Source, "Source"),
      options: [
        'upc',
        'string',
        'meal',
        'custom'
      ],
      methods: [
        Method.create("fromMap", ReflectedType.create(Source, "Source"),
            MethodType.factory, false, null, false, (Map<String, dynamic> map) {
          if (map['value'] == 'Source.upc') {
            return Source.upc;
          }
          if (map['value'] == 'Source.string') {
            return Source.string;
          }
          if (map['value'] == 'Source.meal') {
            return Source.meal;
          }
          if (map['value'] == 'Source.custom') {
            return Source.custom;
          }
          throw Exception("Enum Source can not instantiate from map $map");
        }),
      ])
];

Map<String, ReflectedClass> str2dataclasses = {
  for (ReflectedClass x in dataclasses) x.name: x
};
Map<Type, ReflectedClass> type2dataclasses = {
  for (ReflectedClass x in dataclasses) x.referenceType.referenceType!: x
};

Map<String, EnumExtension> str2enumExtensions = {
  for (EnumExtension x in enumExtensions) x.name: x
};
Map<Type, EnumExtension> type2enumExtensions = {
  for (EnumExtension x in enumExtensions) x.referenceType.referenceType!: x
};

// All together

List<SupportedClasses> reflectedClasses = [
  ...dataclasses,
  ...supportedDefaults,
  ...enumExtensions
];
Map<String, SupportedClasses> str2reflection = {
  ...str2dataclasses,
  ...str2defaults,
  ...str2enumExtensions
};
Map<Type, SupportedClasses> type2reflection = {
  ...type2dataclasses,
  ...type2defaults,
  ...type2enumExtensions
};

// Deserialize JSON

dejsonify(thing) {
  // Map or Recognized
  if (thing is Map) {
    // Recognized
    if (str2reflection[thing['__type']]?.fromMap != null) {
      return str2reflection[thing['__type']]!.fromMap!(thing);
    }
    // Map
    return dejsonifyMap(thing);
  }
  // List
  if (thing is List) {
    return dejsonifyList(thing);
  }
  // Json safe type
  return thing;
}

List dejsonifyList(List list) {
  return list.map((e) => dejsonify(e)).toList();
}

Map dejsonifyMap(Map map) {
  return Map.from(
      map.map((key, value) => MapEntry(dejsonify(key), dejsonify(value))));
}

// Serialize JSON

jsonify(thing) {
  try {
    return thing.toMap();
  } on NoSuchMethodError {
    if (isJsonSafe(thing)) {
      return thing;
    } else if (supportedTypeToMap(thing) != null) {
      return supportedTypeToMap(thing);
    } else if (thing is Iterable && !isMap(thing)) {
      return nestedJsonList(thing);
    } else if (isMap(thing)) {
      return nestedJsonMap(thing);
    } else {
      throw Exception('Error on handling $thing since ${thing.runtimeType} '
          'is not a base class or does not have a toJson() method');
    }
  }
}

List nestedJsonList(Iterable iter) {
  List l = [];
  for (var thing in iter) {
    l.add(jsonify(thing));
  }
  return l;
}

Map nestedJsonMap(mapLikeThing) {
  Map m = {};
  var key;
  var value;

  for (MapEntry mapEntry in mapLikeThing.entries) {
    key = jsonify(mapEntry.key);
    value = jsonify(mapEntry.value);
    m[key] = value;
  }

  return m;
}
