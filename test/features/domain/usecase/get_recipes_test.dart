import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/features/domain/repository/app_repository.dart';
import 'package:tech_task/features/domain/usecase/get_recipes.dart';

import '../../../data/test_recipe_model.dart';

class MockAppRepository extends Mock implements AppRepository {}

void main() {
  MockAppRepository repository;
  GetRecipes getRecipes;

  test("should get list of recipes model from the repository", () async {
    repository = MockAppRepository();
    getRecipes = GetRecipes(repository);
    //stub the method
    when(repository.getRecipes("Bread"))
        .thenAnswer((_) async => Right(testRecipeModel));
    // act
    final result = await getRecipes("Bread");
    // assert
    expect(result, Right(testRecipeModel));
    verify(repository.getRecipes("Bread"));
    verifyNoMoreInteractions(repository);
  });
}
