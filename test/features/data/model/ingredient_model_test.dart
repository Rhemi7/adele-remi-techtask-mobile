import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/features/data/model/ingredient_model.dart';

import '../../../data/data_reader.dart';

main() {

  final testIngredientModel = [
    Ingredient(
        title: "Ham",
        useBy: DateTime.parse("2020-11-25")
    ),
    Ingredient(
        title: "Cheese",
        useBy: DateTime.parse("2020-01-08")
    )
    ,Ingredient(
        title: "Bread",
        useBy: DateTime.parse("2020-11-01")
    ),
  ];

  test("should be a subclass of Ingredient response", () {
    expect(testIngredientModel, isA<List<Ingredient>>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when fromJson is called',
          () async {
        final jsonString = dataReader('ingredient_response.json');
        final result = ingredientFromJson(jsonString);
        expect(result, testIngredientModel);
      },
    );
  });
}