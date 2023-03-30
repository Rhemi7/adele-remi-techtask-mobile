import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecases.dart';
import '../../data/model/recipe_model.dart';
import '../repository/app_repository.dart';

class GetRecipes extends UseCase<List<Recipe>, String> {
  AppRepository repository;
  GetRecipes(this.repository);

  @override
  Future<Either<Failure, List<Recipe>>> call(String params) async {
    return await repository.getRecipes(params);
  }
}