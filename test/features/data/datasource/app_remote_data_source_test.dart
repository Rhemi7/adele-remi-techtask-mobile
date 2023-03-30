import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tech_task/constants/constants.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/features/data/datasources/app_remote_data_source.dart';
import 'package:tech_task/features/data/model/ingredient_model.dart';
import '../../../data/data_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient client;
  late AppRemoteDataSourceImpl dataSource;

  var ingUrl = Uri.parse("${Constant.baseUrl}/ingredients/");

  setUp(() {
    client = MockClient();
    dataSource = AppRemoteDataSourceImpl(client);
  });


  group("Get Ingredients", () {
    test("Returns an Ingredient Response", () async {
      when(client.get(ingUrl)).thenAnswer((_) async => http.Response(dataReader("ingredient_response.json"), 200));

      expect(await dataSource.getIngredients(), isA<List<Ingredient>>());
    });

    test('throws an exception if the http call results in an error', () {
      when(client.get(ingUrl))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => dataSource.getIngredients(),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}