import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/features/data/datasources/app_remote_data_source.dart';
import 'package:tech_task/features/data/model/ingredient_model.dart';
import 'package:tech_task/features/data/repository/app_repository_impl.dart';

class MockAppRemoteDataSource extends Mock implements AppRemoteDataSource{}

void main() {
  late MockAppRemoteDataSource mockAppRemoteDataSource;
  late AppRepositoryImpl repository;

  mockAppRemoteDataSource = MockAppRemoteDataSource();
  repository = AppRepositoryImpl(mockAppRemoteDataSource);

  group("Get Ingredients", () {
    final testIngredientModel = [
      Ingredient(title: "Ham", useBy: DateTime.parse("2020-11-25")),
      Ingredient(title: "Cheese", useBy: DateTime.parse("2020-01-08")),
      Ingredient(title: "Bread", useBy: DateTime.parse("2020-11-01")),
    ];

    test("Should return remote data", () async {
      when(mockAppRemoteDataSource.getIngredients()).thenAnswer((_) async => testIngredientModel);

      final result = await repository.getIngredients();

      verify(mockAppRemoteDataSource.getIngredients());

      expect(result, equals(Right(testIngredientModel)));
    });

  });
}