import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/core/usecases/usecases.dart';
import 'package:tech_task/features/presentation/notifier/ingredients_notifier/get_ingredients_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/model/ingredient_model.dart';
import '../../../domain/usecase/get_ingredients.dart';

class GetIngredientsNotifier extends StateNotifier<GetIngredientsState> {
  GetIngredients getIngredients;
  GetIngredientsNotifier(this.getIngredients)
      : super(const GetIngredientsInitial());

  List<Ingredient> items = [];

  Future<void> getFridgeIngredient() async {
    state = const GetIngredientsLoading();
    var result = await getIngredients(NoParams());
    result.fold(
        (failure) => state = GetIngredientsError(mapFailureToMessage(failure)),
        (r) {
          items = r;
          state = GetIngredientsLoaded(r);
        });
  }
}
