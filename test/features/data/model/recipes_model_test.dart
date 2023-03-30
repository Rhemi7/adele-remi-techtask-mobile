import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/features/data/model/recipe_model.dart';

import '../../../data/test_recipe_model.dart';

main() {
  test("should be a subclass of Recipes response", () {
    expect(testRecipeModel, isA<List<Recipe>>());
  });
}