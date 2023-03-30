
import 'package:tech_task/features/data/model/recipe_model.dart';

abstract class GetRecipesState {
  const GetRecipesState();
}

class GetRecipesInitial extends GetRecipesState {
  const GetRecipesInitial();
}

class GetRecipesLoading extends GetRecipesState {
  const GetRecipesLoading();
}

class GetRecipesLoaded extends GetRecipesState {
  final List<Recipe>? recipes;
  GetRecipesLoaded({this.recipes});
}

class GetRecipesError extends GetRecipesState {
  String message;
  GetRecipesError({required this.message});
}