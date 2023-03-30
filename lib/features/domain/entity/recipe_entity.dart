import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable{
  RecipeEntity({
    this.title,
    this.recipeIngredients,
  });

  final String? title;
  final List<String>? recipeIngredients;

  @override
  List<Object?> get props => [title, recipeIngredients];
}