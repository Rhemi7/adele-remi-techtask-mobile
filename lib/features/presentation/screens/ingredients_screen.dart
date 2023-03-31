import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/features/presentation/notifier/ingredients_notifier/get_ingredients_state.dart';
import 'package:tech_task/features/presentation/provider/providers.dart';
import 'package:tech_task/features/presentation/screens/recipe_screen.dart';
import 'package:tech_task/features/presentation/widgets/app_error_widget.dart';
import 'package:tech_task/utils/margin.dart';

import '../../../utils/resolution.dart';
import '../widgets/button.dart';

class IngredientsScreen extends ConsumerStatefulWidget {
  final String selectedDate;
  const IngredientsScreen(this.selectedDate, {Key? key}) : super(key: key);

  @override
  ConsumerState<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends ConsumerState<IngredientsScreen> {
  // Every ingredient gotten from the server would have a corresponding boolean in this list
  List<bool> values = [];

  //Ingredients selected will be added to this list
  List<String> nameIngredients = [];

  void showCustomDialog(String name) {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Text("Cannot be Added"),
              content: Text(
                  '$name has passed it\'s expiry date and cannot be added. \n\nIf you still wish to select it, please long press the tile.'),
            ));
  }

  void handleSelected({required bool value, required String title}) {
    //If value is true, add name to list
    //If false, remove from list
    if (value) {
      nameIngredients.add(title);
    } else {
      nameIngredients.remove(title);
    }
    setState(() {});
  }

  void init() {
    ref
        .watch(getIngredientsNotifierProvider.notifier)
        .getFridgeIngredient()
        .then((value) {
      for (var item
          in ref.watch(getIngredientsNotifierProvider.notifier).items) {
        //After getting the list of ingredients
        // A list is created where false is assigned to every item
        values.add(false);
      }
    });
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
      appBar: AppBar(
        title: Text("Ingredients"),
      ),
      body: SafeArea(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final ingredientsState = ref.watch(getIngredientsNotifierProvider);
            if (ingredientsState is GetIngredientsLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (ingredientsState is GetIngredientsLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext cxt, int i) {
                          var ingredient = ingredientsState.ingredients[i];

                          return GestureDetector(
                            onLongPress: () {
                              //Long press to add an ingredient that has expired
                              values[i] = true;
                              if (values[i]) {
                                nameIngredients.add(ingredient.title!);
                              }
                              setState(() {});
                            },
                            child: CheckboxListTile(
                              value: values[i],
                              onChanged: (val) {
                                if (DateTime.parse(widget.selectedDate)
                                        .isAfter(ingredient.useBy!) &&
                                    values[i] == false) {
                                  //Show dialog to inform user of expired ingredients
                                  showCustomDialog(ingredient.title!);
                                } else {
                                  values[i] = !values[i];
                                  handleSelected(
                                      value: values[i],
                                      title: ingredient.title!);
                                }
                              },
                              title: Text(ingredient.title!),
                              subtitle: Text(
                                  "Expiry Date: ${ingredient.useBy!.toString().split(" ")[0]}"),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return YMargin(10);
                        },
                        itemCount: ingredientsState.ingredients.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: PrimaryButton(
                      color: Colors.red,
                      width: Resolution.screenWidth(context),
                      paddingHoriz: 25,
                      inActiveButtonColor: Colors.red.withOpacity(0.4),
                      text: "Continue",
                      onPressed: nameIngredients.isEmpty
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeScreen(
                                    //This joins the strings items in the List
                                    //And separate them with a comma
                                    ingredients: nameIngredients.join(","),
                                  ),
                                ),
                              );
                            },
                    ),
                  )
                ],
              );
            } else if (ingredientsState is GetIngredientsError) {
              return AppErrorWidget(
                  error: ingredientsState.message,
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
