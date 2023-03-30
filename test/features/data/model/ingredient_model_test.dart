import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/features/data/model/ingredient_model.dart';

import '../../../data/data_reader.dart';
import '../../../data/test_ingredient_model.dart';

main() {

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

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = ingredientToJson(testIngredientModel);
        // assert
        final expectedMap = jsonEncode([
          {"title": "Ham", "use-by": "2020-11-25"},
          {"title": "Cheese", "use-by": "2020-01-08"},
          {"title": "Bread", "use-by": "2020-11-01"}
        ]);
        expect(result, expectedMap);
      },
    );
  });
}
