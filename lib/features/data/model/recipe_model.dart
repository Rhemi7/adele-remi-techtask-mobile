// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

import 'package:tech_task/features/domain/entity/recipe_entity.dart';

List<Recipe> recipeFromJson(String str) => List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe extends RecipeEntity {
  Recipe({
    this.title,
    this.recipeIngredients,
  });

  final String? title;
  final List<String>? recipeIngredients;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    title: json["title"],
    recipeIngredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "ingredients": recipeIngredients == null ? [] : List<dynamic>.from(recipeIngredients!.map((x) => x)),
  };
}
