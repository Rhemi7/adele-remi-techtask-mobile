import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/features/data/model/recipe_model.dart';

import '../../../data/data_reader.dart';
import '../../../data/test_recipe_model.dart';

main() {
  test("should be a subclass of Recipes response", () {
    expect(testRecipeModel, isA<List<Recipe>>());
  });

  group('fromJson', () {
    test(
      'should return a valid recipe model when fromJson is called',
          () async {
        final jsonString = dataReader('recipe_response.json');
        final result = recipeFromJson(jsonString);
        expect(result, testRecipeModel);
      },
    );
  });
}