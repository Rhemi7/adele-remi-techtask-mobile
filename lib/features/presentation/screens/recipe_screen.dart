import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/features/presentation/notifier/recipes_notifier/get_recipes_state.dart';
import 'package:tech_task/utils/margin.dart';

import '../provider/providers.dart';
import '../widgets/app_error_widget.dart';

class RecipeScreen extends ConsumerStatefulWidget {
  final String ingredients;
  const RecipeScreen({Key? key, required this.ingredients}) : super(key: key);

  @override
  ConsumerState<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends ConsumerState<RecipeScreen> {
  void init() {
    ref
        .watch(getRecipesNotifierProvider.notifier)
        .getFoodRecipes(widget.ingredients);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipes")),
      body: SafeArea(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final recipeState = ref.watch(getRecipesNotifierProvider);
            if (recipeState is GetRecipesLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (recipeState is GetRecipesLoaded) {
              var recipes = recipeState.recipes;
              return SingleChildScrollView(
                child: Column(
                  children: recipes!
                      .map((recipe) => Container(
                            height: 110,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recipe.title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    YMargin(5),
                                    Text(
                                      "Recipes",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.red,
                                          fontSize: 12),
                                    ),
                                    Expanded(
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          // spacing on the vertical axis
                                          // mainAxisSpacing: 2,
                                          crossAxisCount: 3,
                                          childAspectRatio: 2.7 / 0.5,
                                        ),
                                        itemBuilder: (cxt, index) {
                                          return Text(
                                              recipe.recipeIngredients![index]);
                                        },
                                        itemCount:
                                            recipe.recipeIngredients?.length,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              );
            } else if (recipeState is GetRecipesError) {
              return AppErrorWidget(
                  error: recipeState.message,
                  onTap: () {
                    init();
                  });
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
