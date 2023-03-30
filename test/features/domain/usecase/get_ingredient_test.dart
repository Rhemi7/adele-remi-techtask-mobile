import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/core/usecases/usecases.dart';
import 'package:tech_task/features/data/model/ingredient_model.dart';
import 'package:tech_task/features/domain/repository/app_repository.dart';
import 'package:tech_task/features/domain/usecase/get_ingredients.dart';

class MockAppRepository extends Mock implements AppRepository {}

void main() {

  MockAppRepository repository;
  GetIngredients getIngredients;

  final testIngredientModel = [
    Ingredient(title: "Ham", useBy: DateTime.parse("2020-11-25")),
    Ingredient(title: "Cheese", useBy: DateTime.parse("2020-01-08")),
    Ingredient(title: "Bread", useBy: DateTime.parse("2020-11-01")),
  ];

  test("should get ingredient response from the repository", () async {
    repository = MockAppRepository();
    getIngredients = GetIngredients(repository);

    when(repository.getIngredients()).thenAnswer((_) async => Right(testIngredientModel));

    final result = await getIngredients(NoParams());

    expect(result, Right(testIngredientModel));
    verify(repository.getIngredients());
    verifyNoMoreInteractions(repository);
  });
}