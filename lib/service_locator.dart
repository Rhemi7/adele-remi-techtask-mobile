import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tech_task/features/data/datasources/app_remote_data_source.dart';
import 'package:tech_task/features/data/repository/app_repository_impl.dart';
import 'package:tech_task/features/domain/repository/app_repository.dart';
import 'package:tech_task/features/domain/usecase/get_ingredients.dart';


GetIt sl = GetIt.instance;


Future<void> setUpLocator() async {

  //Http Client
  sl.registerLazySingleton(() => http.Client());

  //Dependency Injection for Remote Data Source
  sl.registerLazySingleton<AppRemoteDataSource>(() => AppRemoteDataSourceImpl(sl()));

  //Dependency Injection for App Repository class
  sl.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(sl()));

  // Dependency injection for Get Ingredients Use case
  sl.registerLazySingleton<GetIngredients>(() => GetIngredients(sl()));
}