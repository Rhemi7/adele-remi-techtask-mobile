import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/features/presentation/notifier/ingredients_notifier/get_ingredients_state.dart';
import 'package:tech_task/features/presentation/provider/providers.dart';
import 'package:tech_task/utils/margin.dart';

import '../../../utils/resolution.dart';
import '../widgets/button.dart';

class IngredientsScreen extends ConsumerStatefulWidget {
  const IngredientsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends ConsumerState<IngredientsScreen> {
  List<bool> values = [];
  List<String> nameIngredients = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(getIngredientsNotifierProvider.notifier)
          .getFridgeIngredient()
          .then((value) {
        for (var item
            in ref.watch(getIngredientsNotifierProvider.notifier).items) {
          values.add(false);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return GestureDetector(
                            onLongPress: () {
                              values[i] = true;
                              if (values[i]) {
                                nameIngredients.add(
                                    ingredientsState.ingredients[i].title!);
                              }
                              setState(() {});
                            },
                            child: CheckboxListTile(
                              value: values[i],
                              onChanged: (val) {
                                if (DateTime.now().isAfter(ingredientsState
                                        .ingredients[i].useBy!) &&
                                    values[i] == false) {
                                  showDialog(
                                      context: context,
                                      builder: (builder) => AlertDialog(
                                            title: Text("Cannot be Added"),
                                            content: Text(
                                                '${ingredientsState.ingredients[i].title!} has passed it\'s expiry date and cannot be added. \n\nIf you still wish to select it, please long press the tile.'),
                                          ));
                                } else {
                                  values[i] = !values[i];
                                  if (values[i]) {
                                    nameIngredients.add(
                                        ingredientsState.ingredients[i].title!);
                                  } else {
                                    nameIngredients.remove(
                                        ingredientsState.ingredients[i].title!);
                                  }
                                  setState(() {});
                                }
                              },
                              title:
                                  Text(ingredientsState.ingredients[i].title!),
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
                      inActiveButtonColor: Colors.red,
                      text: "Continue",
                      onPressed: () {
                        // values.forEach((element) {
                        //   if (element == true) {
                        //     nameIngredients.add(element)
                        //   }
                        // })
                        // print(values.where((element) => element == true).);
                      },
                    ),
                  )
                ],
              );
            } else if (ingredientsState is GetIngredientsError) {
              return Text(ingredientsState.message);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
