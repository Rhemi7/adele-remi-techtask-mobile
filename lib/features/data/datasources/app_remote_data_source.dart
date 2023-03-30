import 'package:tech_task/constants/constants.dart';

import '../../../core/error/failure.dart';
import '../model/ingredient_model.dart';
import 'package:http/http.dart' as http;

abstract class AppRemoteDataSource {
  Future<List<Ingredient>> getIngredients();
}

class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  AppRemoteDataSourceImpl(this.client);

  final http.Client client;

  @override
  Future<List<Ingredient>> getIngredients() async {
    var data = await client.get(
      Uri.parse('${Constant.baseUrl}/ingredients/'),
    );

    if (data.statusCode.toString().startsWith("2")) {
      List<Ingredient> response =
          (data as List).map((e) => Ingredient.fromJson(e)).toList();
      return response;
    } else {
      throw ServerException();
    }
  }
}
