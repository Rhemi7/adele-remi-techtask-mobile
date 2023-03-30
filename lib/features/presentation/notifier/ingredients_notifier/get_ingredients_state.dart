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
  const GetIngredientsLoaded();
}

class GetIngredientsError extends GetIngredientsState {
  String message;
  GetIngredientsError(this.message);
}



