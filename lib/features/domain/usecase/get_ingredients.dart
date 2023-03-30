
import 'package:dartz/dartz.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/core/usecases/usecases.dart';
import 'package:tech_task/features/data/model/ingredient_model.dart';
import 'package:tech_task/features/domain/repository/app_repository.dart';

class GetIngredients extends UseCase<List<Ingredient>, NoParams> {
  AppRepository repository;
  GetIngredients(this.repository);

  @override
  Future<Either<Failure, List<Ingredient>>> call(NoParams params) async {
    return await repository.getIngredients();
  }
}