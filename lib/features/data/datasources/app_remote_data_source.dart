import 'package:tech_task/constants/constants.dart';

import '../../../core/error/failure.dart';
import '../model/ingredient_model.dart';
import 'package:http/http.dart' as http;

import '../model/recipe_model.dart';

abstract class AppRemoteDataSource {
  Future<List<Ingredient>> getIngredients();

  Future<List<Recipe>> getRecipes(String ingredients);
}

class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  AppRemoteDataSourceImpl(this.client);

  final http.Client client;

  @override
  Future<List<Ingredient>> getIngredients() async {
    try {
      var response = await client.get(
        Uri.parse('${Constant.baseUrl}/ingredients/'),
      );
      if (response.statusCode.toString().startsWith("2")) {
        var data = ingredientFromJson(response.body);
        return data;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Recipe>> getRecipes(String ingredients) async {
    try {
      var response = await client.get(
        Uri.parse('${Constant.baseUrl}/recipes?ingredients=$ingredients'),
      );
      if (response.statusCode.toString().startsWith("2")) {
        var data = recipeFromJson(response.body);
        return data;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
