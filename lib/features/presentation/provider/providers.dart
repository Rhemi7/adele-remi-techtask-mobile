import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/features/domain/usecase/get_ingredients.dart';
import 'package:tech_task/features/presentation/notifier/ingredients_notifier/get_ingredients_notifier.dart';
import 'package:tech_task/features/presentation/notifier/ingredients_notifier/get_ingredients_state.dart';

import '../../../service_locator.dart';
import '../../domain/usecase/get_recipes.dart';
import '../notifier/recipes_notifier/get_recipes_notifier.dart';
import '../notifier/recipes_notifier/get_recipes_state.dart';

final getIngredientsProvider =
    Provider<GetIngredients>((ref) => GetIngredients(sl()));

final getIngredientsNotifierProvider =
    StateNotifierProvider<GetIngredientsNotifier, GetIngredientsState>(
        (ref) => GetIngredientsNotifier(ref.watch(getIngredientsProvider)));

final getRecipesProvider =
Provider<GetRecipes>((ref) => GetRecipes(sl()));

final getRecipesNotifierProvider =
StateNotifierProvider<GetRecipesNotifier, GetRecipesState>(
        (ref) => GetRecipesNotifier(ref.watch(getRecipesProvider)));
