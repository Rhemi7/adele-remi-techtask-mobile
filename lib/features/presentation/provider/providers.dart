import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/features/domain/usecase/get_ingredients.dart';
import 'package:tech_task/features/presentation/notifier/ingredients_notifier/get_ingredients_notifier.dart';
import 'package:tech_task/features/presentation/notifier/ingredients_notifier/get_ingredients_state.dart';

import '../../../service_locator.dart';

final getIngredientsProvider =
    Provider<GetIngredients>((ref) => GetIngredients(sl()));

final getIngredientsNotifierProvider =
    StateNotifierProvider<GetIngredientsNotifier, GetIngredientsState>(
        (ref) => GetIngredientsNotifier(ref.watch(getIngredientsProvider)));
