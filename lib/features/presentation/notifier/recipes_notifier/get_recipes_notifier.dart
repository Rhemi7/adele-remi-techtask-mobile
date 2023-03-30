import 'package:flutter/gestures.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/features/domain/usecase/get_recipes.dart';
import 'package:tech_task/features/presentation/notifier/recipes_notifier/get_recipes_state.dart';

import '../../../../core/error/failure.dart';

class GetRecipesNotifier extends StateNotifier<GetRecipesState> {
  GetRecipes getRecipes;
  GetRecipesNotifier(this.getRecipes): super(const GetRecipesInitial());

  void getFoodRecipes(String ingredients) async {
    state = const GetRecipesLoading();
        var result = await getRecipes(ingredients);
        result.fold((l) => state = GetRecipesError(message: mapFailureToMessage(l)), (r) {
          state = GetRecipesLoaded(recipes: r);
        });
  }
}