
import 'package:dartz/dartz.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/features/data/model/ingredient_model.dart';
import 'package:tech_task/features/data/model/recipe_model.dart';

abstract class AppRepository {
  Future<Either<Failure, List<Ingredient>>> getIngredients();
  Future<Either<Failure, List<Recipe>>> getRecipes(String ingredients);
}