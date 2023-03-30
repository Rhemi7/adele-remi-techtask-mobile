
import 'package:dartz/dartz.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/features/data/datasources/app_remote_data_source.dart';
import 'package:tech_task/features/data/model/ingredient_model.dart';
import 'package:tech_task/features/data/model/recipe_model.dart';
import 'package:tech_task/features/domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  AppRemoteDataSource dataSource;
  AppRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<Ingredient>>> getIngredients() async {
    try {
      final remoteIngredients = await dataSource.getIngredients();
      return Right(remoteIngredients);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> getRecipes(String ingredients) async {
    try {
      final remoteRecipes = await dataSource.getRecipes(ingredients);
      return Right(remoteRecipes);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}