import 'package:nutrition_app/domain/individual_nutrients.dart';
import 'dart:convert';
import 'package:nutrition_app/domain/dataclasses.dart';
import 'individual_nutrients.dart';
import 'package:dataclasses/dataclasses.dart';

List<ReflectedClass> dataclasses = [
  ReflectedClass(
      name: 'VitaminK',
      referenceType: ReflectedType.create(VitaminK, 'VitaminK'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, VitaminK.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, VitaminK.unit)
      ],
      getters: [],
      methods: [
        Method.create('VitaminK', ReflectedType.create(VitaminK, 'VitaminK'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(VitaminK, 'VitaminK'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(VitaminK, 'VitaminK'),
            MethodType.factory, false, null, false, VitaminK.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
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
      name: 'Sugars',
      referenceType: ReflectedType.create(Sugars, 'Sugars'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Sugars.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Sugars.unit)
      ],
      getters: [],
      methods: [
        Method.create('Sugars', ReflectedType.create(Sugars, 'Sugars'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Sugars, 'Sugars'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Sugars, 'Sugars'),
            MethodType.factory, false, null, false, Sugars.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'VitaminA',
      referenceType: ReflectedType.create(VitaminA, 'VitaminA'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, VitaminA.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, VitaminA.unit)
      ],
      getters: [],
      methods: [
        Method.create('VitaminA', ReflectedType.create(VitaminA, 'VitaminA'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(VitaminA, 'VitaminA'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(VitaminA, 'VitaminA'),
            MethodType.factory, false, null, false, VitaminA.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Ingredient',
      referenceType: ReflectedType.create(Ingredient, 'Ingredient'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [],
      getters: [],
      methods: [
        Method.create(
            'toMealComponent',
            ReflectedType.create(MealComponent, 'MealComponent'),
            MethodType.normal,
            false,
            null,
            false,
            null)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'DPA',
      referenceType: ReflectedType.create(DPA, 'DPA'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, DPA.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, DPA.unit)
      ],
      getters: [],
      methods: [
        Method.create('DPA', ReflectedType.create(DPA, 'DPA'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(DPA, 'DPA'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(DPA, 'DPA'),
            MethodType.factory, false, null, false, DPA.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Magnesium',
      referenceType: ReflectedType.create(Magnesium, 'Magnesium'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Magnesium.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Magnesium.unit)
      ],
      getters: [],
      methods: [
        Method.create('Magnesium', ReflectedType.create(Magnesium, 'Magnesium'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Magnesium, 'Magnesium'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Magnesium, 'Magnesium'),
            MethodType.factory, false, null, false, Magnesium.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Cholesterol',
      referenceType: ReflectedType.create(Cholesterol, 'Cholesterol'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Cholesterol.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Cholesterol.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'Cholesterol',
            ReflectedType.create(Cholesterol, 'Cholesterol'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(Cholesterol, 'Cholesterol'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'fromMap',
            ReflectedType.create(Cholesterol, 'Cholesterol'),
            MethodType.factory,
            false,
            null,
            false,
            Cholesterol.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'VitaminC',
      referenceType: ReflectedType.create(VitaminC, 'VitaminC'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, VitaminC.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, VitaminC.unit)
      ],
      getters: [],
      methods: [
        Method.create('VitaminC', ReflectedType.create(VitaminC, 'VitaminC'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(VitaminC, 'VitaminC'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(VitaminC, 'VitaminC'),
            MethodType.factory, false, null, false, VitaminC.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Potassium',
      referenceType: ReflectedType.create(Potassium, 'Potassium'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Potassium.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Potassium.unit)
      ],
      getters: [],
      methods: [
        Method.create('Potassium', ReflectedType.create(Potassium, 'Potassium'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Potassium, 'Potassium'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Potassium, 'Potassium'),
            MethodType.factory, false, null, false, Potassium.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Phosphorus',
      referenceType: ReflectedType.create(Phosphorus, 'Phosphorus'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Phosphorus.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Phosphorus.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'Phosphorus',
            ReflectedType.create(Phosphorus, 'Phosphorus'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(Phosphorus, 'Phosphorus'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromMap', ReflectedType.create(Phosphorus, 'Phosphorus'),
            MethodType.factory, false, null, false, Phosphorus.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Fiber',
      referenceType: ReflectedType.create(Fiber, 'Fiber'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Fiber.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Fiber.unit)
      ],
      getters: [],
      methods: [
        Method.create('Fiber', ReflectedType.create(Fiber, 'Fiber'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Fiber, 'Fiber'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Fiber, 'Fiber'),
            MethodType.factory, false, null, false, Fiber.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Folate',
      referenceType: ReflectedType.create(Folate, 'Folate'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Folate.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Folate.unit)
      ],
      getters: [],
      methods: [
        Method.create('Folate', ReflectedType.create(Folate, 'Folate'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Folate, 'Folate'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Folate, 'Folate'),
            MethodType.factory, false, null, false, Folate.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Choline',
      referenceType: ReflectedType.create(Choline, 'Choline'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Choline.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Choline.unit)
      ],
      getters: [],
      methods: [
        Method.create('Choline', ReflectedType.create(Choline, 'Choline'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Choline, 'Choline'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Choline, 'Choline'),
            MethodType.factory, false, null, false, Choline.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Calcium',
      referenceType: ReflectedType.create(Calcium, 'Calcium'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Calcium.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Calcium.unit)
      ],
      getters: [],
      methods: [
        Method.create('Calcium', ReflectedType.create(Calcium, 'Calcium'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Calcium, 'Calcium'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Calcium, 'Calcium'),
            MethodType.factory, false, null, false, Calcium.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'ALA',
      referenceType: ReflectedType.create(ALA, 'ALA'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, ALA.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, ALA.unit)
      ],
      getters: [],
      methods: [
        Method.create('ALA', ReflectedType.create(ALA, 'ALA'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(ALA, 'ALA'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(ALA, 'ALA'),
            MethodType.factory, false, null, false, ALA.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'TotalFat',
      referenceType: ReflectedType.create(TotalFat, 'TotalFat'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, TotalFat.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, TotalFat.unit)
      ],
      getters: [],
      methods: [
        Method.create('TotalFat', ReflectedType.create(TotalFat, 'TotalFat'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(TotalFat, 'TotalFat'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(TotalFat, 'TotalFat'),
            MethodType.factory, false, null, false, TotalFat.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'TransFat',
      referenceType: ReflectedType.create(TransFat, 'TransFat'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, TransFat.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, TransFat.unit)
      ],
      getters: [],
      methods: [
        Method.create('TransFat', ReflectedType.create(TransFat, 'TransFat'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(TransFat, 'TransFat'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(TransFat, 'TransFat'),
            MethodType.factory, false, null, false, TransFat.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'LinoleicAcid',
      referenceType: ReflectedType.create(LinoleicAcid, 'LinoleicAcid'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, LinoleicAcid.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, LinoleicAcid.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'LinoleicAcid',
            ReflectedType.create(LinoleicAcid, 'LinoleicAcid'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(LinoleicAcid, 'LinoleicAcid'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'fromMap',
            ReflectedType.create(LinoleicAcid, 'LinoleicAcid'),
            MethodType.factory,
            false,
            null,
            false,
            LinoleicAcid.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'SaturatedFat',
      referenceType: ReflectedType.create(SaturatedFat, 'SaturatedFat'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, SaturatedFat.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, SaturatedFat.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'SaturatedFat',
            ReflectedType.create(SaturatedFat, 'SaturatedFat'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(SaturatedFat, 'SaturatedFat'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'fromMap',
            ReflectedType.create(SaturatedFat, 'SaturatedFat'),
            MethodType.factory,
            false,
            null,
            false,
            SaturatedFat.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'DHA',
      referenceType: ReflectedType.create(DHA, 'DHA'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, DHA.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, DHA.unit)
      ],
      getters: [],
      methods: [
        Method.create('DHA', ReflectedType.create(DHA, 'DHA'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(DHA, 'DHA'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(DHA, 'DHA'),
            MethodType.factory, false, null, false, DHA.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Selenium',
      referenceType: ReflectedType.create(Selenium, 'Selenium'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Selenium.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Selenium.unit)
      ],
      getters: [],
      methods: [
        Method.create('Selenium', ReflectedType.create(Selenium, 'Selenium'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Selenium, 'Selenium'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Selenium, 'Selenium'),
            MethodType.factory, false, null, false, Selenium.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Carbohydrate',
      referenceType: ReflectedType.create(Carbohydrate, 'Carbohydrate'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Carbohydrate.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Carbohydrate.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'Carbohydrate',
            ReflectedType.create(Carbohydrate, 'Carbohydrate'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(Carbohydrate, 'Carbohydrate'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'fromMap',
            ReflectedType.create(Carbohydrate, 'Carbohydrate'),
            MethodType.factory,
            false,
            null,
            false,
            Carbohydrate.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Riboflavin',
      referenceType: ReflectedType.create(Riboflavin, 'Riboflavin'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Riboflavin.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Riboflavin.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'Riboflavin',
            ReflectedType.create(Riboflavin, 'Riboflavin'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(Riboflavin, 'Riboflavin'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromMap', ReflectedType.create(Riboflavin, 'Riboflavin'),
            MethodType.factory, false, null, false, Riboflavin.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'UnsaturatedFat',
      referenceType: ReflectedType.create(UnsaturatedFat, 'UnsaturatedFat'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(dynamic, 'dynamic?'),
            false, true, true, false, false, UnsaturatedFat.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, UnsaturatedFat.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'UnsaturatedFat',
            ReflectedType.create(UnsaturatedFat, 'UnsaturatedFat'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(UnsaturatedFat, 'UnsaturatedFat'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'fromMap',
            ReflectedType.create(UnsaturatedFat, 'UnsaturatedFat'),
            MethodType.factory,
            false,
            null,
            false,
            UnsaturatedFat.fromMap)
      ],
      parent: Nutrient,
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
      name: 'Nutrients',
      referenceType: ReflectedType.create(Nutrients, 'Nutrients'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create('calories', ReflectedType.create(Nutrient, 'Nutrient'),
            false, false, false, false, false, null),
        Attribute.create(
            'unsaturatedFat',
            ReflectedType.create(Nutrient, 'Nutrient'),
            false,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'saturatedFat',
            ReflectedType.create(Nutrient, 'Nutrient'),
            false,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('protein', ReflectedType.create(Nutrient, 'Nutrient'),
            false, false, false, false, false, null),
        Attribute.create(
            'carbohydrates',
            ReflectedType.create(Nutrient, 'Nutrient'),
            false,
            false,
            false,
            false,
            false,
            null)
      ],
      getters: [
        Getter.create(ReflectedType.create(Map, 'Map<String, dynamic?>'),
            'attributes__', false, false)
      ],
      methods: [
        Method.create('Ingredient', ReflectedType.create(dynamic, 'dynamic?'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'staticConstructor',
            ReflectedType.create(Nutrients, 'Nutrients'),
            MethodType.factory,
            false,
            null,
            false,
            Nutrients.staticConstructor),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'copyWithIngredient',
            ReflectedType.create(Ingredient, 'Ingredient'),
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
      name: 'VitaminD',
      referenceType: ReflectedType.create(VitaminD, 'VitaminD'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, VitaminD.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, VitaminD.unit)
      ],
      getters: [],
      methods: [
        Method.create('VitaminD', ReflectedType.create(VitaminD, 'VitaminD'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(VitaminD, 'VitaminD'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(VitaminD, 'VitaminD'),
            MethodType.factory, false, null, false, VitaminD.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Manganese',
      referenceType: ReflectedType.create(Manganese, 'Manganese'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Manganese.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Manganese.unit)
      ],
      getters: [],
      methods: [
        Method.create('Manganese', ReflectedType.create(Manganese, 'Manganese'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Manganese, 'Manganese'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Manganese, 'Manganese'),
            MethodType.factory, false, null, false, Manganese.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Calories',
      referenceType: ReflectedType.create(Calories, 'Calories'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Calories.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Calories.unit)
      ],
      getters: [],
      methods: [
        Method.create('Calories', ReflectedType.create(Calories, 'Calories'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Calories, 'Calories'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Calories, 'Calories'),
            MethodType.factory, false, null, false, Calories.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'VitaminB6',
      referenceType: ReflectedType.create(VitaminB6, 'VitaminB6'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, VitaminB6.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, VitaminB6.unit)
      ],
      getters: [],
      methods: [
        Method.create('VitaminB6', ReflectedType.create(VitaminB6, 'VitaminB6'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(VitaminB6, 'VitaminB6'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(VitaminB6, 'VitaminB6'),
            MethodType.factory, false, null, false, VitaminB6.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Protein',
      referenceType: ReflectedType.create(Protein, 'Protein'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Protein.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Protein.unit)
      ],
      getters: [],
      methods: [
        Method.create('Protein', ReflectedType.create(Protein, 'Protein'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Protein, 'Protein'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Protein, 'Protein'),
            MethodType.factory, false, null, false, Protein.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Copper',
      referenceType: ReflectedType.create(Copper, 'Copper'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Copper.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Copper.unit)
      ],
      getters: [],
      methods: [
        Method.create('Copper', ReflectedType.create(Copper, 'Copper'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Copper, 'Copper'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Copper, 'Copper'),
            MethodType.factory, false, null, false, Copper.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Niacin',
      referenceType: ReflectedType.create(Niacin, 'Niacin'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Niacin.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Niacin.unit)
      ],
      getters: [],
      methods: [
        Method.create('Niacin', ReflectedType.create(Niacin, 'Niacin'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Niacin, 'Niacin'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Niacin, 'Niacin'),
            MethodType.factory, false, null, false, Niacin.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Thiamin',
      referenceType: ReflectedType.create(Thiamin, 'Thiamin'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Thiamin.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Thiamin.unit)
      ],
      getters: [],
      methods: [
        Method.create('Thiamin', ReflectedType.create(Thiamin, 'Thiamin'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Thiamin, 'Thiamin'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Thiamin, 'Thiamin'),
            MethodType.factory, false, null, false, Thiamin.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'PantothenicAcid',
      referenceType: ReflectedType.create(PantothenicAcid, 'PantothenicAcid'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, PantothenicAcid.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, PantothenicAcid.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'PantothenicAcid',
            ReflectedType.create(PantothenicAcid, 'PantothenicAcid'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(PantothenicAcid, 'PantothenicAcid'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create(
            'fromMap',
            ReflectedType.create(PantothenicAcid, 'PantothenicAcid'),
            MethodType.factory,
            false,
            null,
            false,
            PantothenicAcid.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Zinc',
      referenceType: ReflectedType.create(Zinc, 'Zinc'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Zinc.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Zinc.unit)
      ],
      getters: [],
      methods: [
        Method.create('Zinc', ReflectedType.create(Zinc, 'Zinc'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Zinc, 'Zinc'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Zinc, 'Zinc'),
            MethodType.factory, false, null, false, Zinc.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Nutrients2',
      referenceType: ReflectedType.create(Nutrients2, 'Nutrients2'),
      dataclassAnnotation: Annotation.create('Dataclass', [], {}),
      attributes: [
        Attribute.create('calcium', ReflectedType.create(Calcium, 'Calcium'),
            true, false, false, false, false, null),
        Attribute.create(
            'carbohydrate',
            ReflectedType.create(Carbohydrate, 'Carbohydrate'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'cholesterol',
            ReflectedType.create(Cholesterol, 'Cholesterol'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('calories', ReflectedType.create(Calories, 'Calories'),
            true, false, false, false, false, null),
        Attribute.create(
            'saturatedFat',
            ReflectedType.create(SaturatedFat, 'SaturatedFat'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('totalFat', ReflectedType.create(TotalFat, 'TotalFat'),
            true, false, false, false, false, null),
        Attribute.create('transFat', ReflectedType.create(TransFat, 'TransFat'),
            true, false, false, false, false, null),
        Attribute.create('iron', ReflectedType.create(Iron, 'Iron'), true,
            false, false, false, false, null),
        Attribute.create('fiber', ReflectedType.create(Fiber, 'Fiber'), true,
            false, false, false, false, null),
        Attribute.create(
            'potassium',
            ReflectedType.create(Potassium, 'Potassium'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('sodium', ReflectedType.create(Sodium, 'Sodium'), true,
            false, false, false, false, null),
        Attribute.create('protein', ReflectedType.create(Protein, 'Protein'),
            true, false, false, false, false, null),
        Attribute.create('sugars', ReflectedType.create(Sugars, 'Sugars'), true,
            false, false, false, false, null),
        Attribute.create('choline', ReflectedType.create(Choline, 'Choline'),
            true, false, false, false, false, null),
        Attribute.create('copper', ReflectedType.create(Copper, 'Copper'), true,
            false, false, false, false, null),
        Attribute.create('aLA', ReflectedType.create(ALA, 'ALA'), true, false,
            false, false, false, null),
        Attribute.create(
            'linoleicAcid',
            ReflectedType.create(LinoleicAcid, 'LinoleicAcid'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('ePA', ReflectedType.create(EPA, 'EPA'), true, false,
            false, false, false, null),
        Attribute.create('dPA', ReflectedType.create(DPA, 'DPA'), true, false,
            false, false, false, null),
        Attribute.create('dHA', ReflectedType.create(DHA, 'DHA'), true, false,
            false, false, false, null),
        Attribute.create('folate', ReflectedType.create(Folate, 'Folate'), true,
            false, false, false, false, null),
        Attribute.create(
            'magnesium',
            ReflectedType.create(Magnesium, 'Magnesium'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'manganese',
            ReflectedType.create(Manganese, 'Manganese'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('niacin', ReflectedType.create(Niacin, 'Niacin'), true,
            false, false, false, false, null),
        Attribute.create(
            'phosphorus',
            ReflectedType.create(Phosphorus, 'Phosphorus'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'pantothenicAcid',
            ReflectedType.create(PantothenicAcid, 'PantothenicAcid'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'riboflavin',
            ReflectedType.create(Riboflavin, 'Riboflavin'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('selenium', ReflectedType.create(Selenium, 'Selenium'),
            true, false, false, false, false, null),
        Attribute.create('thiamin', ReflectedType.create(Thiamin, 'Thiamin'),
            true, false, false, false, false, null),
        Attribute.create('vitaminE', ReflectedType.create(VitaminE, 'VitaminE'),
            true, false, false, false, false, null),
        Attribute.create('vitaminA', ReflectedType.create(VitaminA, 'VitaminA'),
            true, false, false, false, false, null),
        Attribute.create(
            'vitaminB12',
            ReflectedType.create(VitaminB12, 'VitaminB12'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create(
            'vitaminB6',
            ReflectedType.create(VitaminB6, 'VitaminB6'),
            true,
            false,
            false,
            false,
            false,
            null),
        Attribute.create('vitaminC', ReflectedType.create(VitaminC, 'VitaminC'),
            true, false, false, false, false, null),
        Attribute.create('vitaminD', ReflectedType.create(VitaminD, 'VitaminD'),
            true, false, false, false, false, null),
        Attribute.create('vitaminK', ReflectedType.create(VitaminK, 'VitaminK'),
            true, false, false, false, false, null),
        Attribute.create('zinc', ReflectedType.create(Zinc, 'Zinc'), true,
            false, false, false, false, null),
        Attribute.create(
            'unsaturatedFat',
            ReflectedType.create(UnsaturatedFat, 'UnsaturatedFat'),
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
        Method.create(
            'Nutrients2',
            ReflectedType.create(Nutrients2, 'Nutrients2'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'staticConstructor',
            ReflectedType.create(Nutrients2, 'Nutrients2'),
            MethodType.factory,
            false,
            null,
            false,
            Nutrients2.staticConstructor),
        Method.create('==', ReflectedType.create(bool, 'bool'),
            MethodType.operator, false, null, false, null),
        Method.create('toString', ReflectedType.create(String, 'String'),
            MethodType.normal, false, null, false, null),
        Method.create(
            'copyWithNutrients2',
            ReflectedType.create(Nutrients2, 'Nutrients2'),
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
            ReflectedType.create(Nutrients2, 'Nutrients2'),
            MethodType.factory,
            false,
            null,
            false,
            Nutrients2.fromJson),
        Method.create('fromMap', ReflectedType.create(Nutrients2, 'Nutrients2'),
            MethodType.factory, false, null, false, Nutrients2.fromMap)
      ],
      parent: null,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'VitaminE',
      referenceType: ReflectedType.create(VitaminE, 'VitaminE'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, VitaminE.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, VitaminE.unit)
      ],
      getters: [],
      methods: [
        Method.create('VitaminE', ReflectedType.create(VitaminE, 'VitaminE'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(VitaminE, 'VitaminE'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(VitaminE, 'VitaminE'),
            MethodType.factory, false, null, false, VitaminE.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'Iron',
      referenceType: ReflectedType.create(Iron, 'Iron'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Iron.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Iron.unit)
      ],
      getters: [],
      methods: [
        Method.create('Iron', ReflectedType.create(Iron, 'Iron'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Iron, 'Iron'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Iron, 'Iron'),
            MethodType.factory, false, null, false, Iron.fromMap)
      ],
      parent: Nutrient,
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
      name: 'Sodium',
      referenceType: ReflectedType.create(Sodium, 'Sodium'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, Sodium.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, Sodium.unit)
      ],
      getters: [],
      methods: [
        Method.create('Sodium', ReflectedType.create(Sodium, 'Sodium'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(Sodium, 'Sodium'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(Sodium, 'Sodium'),
            MethodType.factory, false, null, false, Sodium.fromMap)
      ],
      parent: Nutrient,
      mixins: null,
      implementations: null),
  ReflectedClass(
      name: 'VitaminB12',
      referenceType: ReflectedType.create(VitaminB12, 'VitaminB12'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, VitaminB12.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, VitaminB12.unit)
      ],
      getters: [],
      methods: [
        Method.create(
            'VitaminB12',
            ReflectedType.create(VitaminB12, 'VitaminB12'),
            MethodType.constructor,
            false,
            null,
            false,
            null),
        Method.create(
            'copyWith',
            ReflectedType.create(VitaminB12, 'VitaminB12'),
            MethodType.normal,
            false,
            null,
            false,
            null),
        Method.create('fromMap', ReflectedType.create(VitaminB12, 'VitaminB12'),
            MethodType.factory, false, null, false, VitaminB12.fromMap)
      ],
      parent: Nutrient,
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
      name: 'EPA',
      referenceType: ReflectedType.create(EPA, 'EPA'),
      dataclassAnnotation: Annotation.create('Dataclass', [],
          {'all': 'false', 'constructor': 'true', 'copyWith': 'true'}),
      attributes: [
        Attribute.create('apiId', ReflectedType.create(int, 'int'), false, true,
            true, false, false, EPA.apiId),
        Attribute.create('unit', ReflectedType.create(String, 'String'), false,
            true, true, false, false, EPA.unit)
      ],
      getters: [],
      methods: [
        Method.create('EPA', ReflectedType.create(EPA, 'EPA'),
            MethodType.constructor, false, null, false, null),
        Method.create('copyWith', ReflectedType.create(EPA, 'EPA'),
            MethodType.normal, false, null, false, null),
        Method.create('fromMap', ReflectedType.create(EPA, 'EPA'),
            MethodType.factory, false, null, false, EPA.fromMap)
      ],
      parent: Nutrient,
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
