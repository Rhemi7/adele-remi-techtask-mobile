import '../../../data/model/ingredient_model.dart';

abstract class GetIngredientsState{
  const GetIngredientsState();
}

class GetIngredientsInitial extends GetIngredientsState {
  const GetIngredientsInitial();
}

class GetIngredientsLoading extends GetIngredientsState {
  const GetIngredientsLoading();
}

class GetIngredientsLoaded extends GetIngredientsState {
  List<Ingredient> ingredients;
  GetIngredientsLoaded(this.ingredients);
}

class GetIngredientsError extends GetIngredientsState {
  String message;
  GetIngredientsError(this.message);
}



