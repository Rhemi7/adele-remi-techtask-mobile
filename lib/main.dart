import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/features/presentation/screens/date_screen.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize dependency injection
  await di.setUpLocator();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          backgroundColor: const Color(0xff212121),
          appBarTheme: const AppBarTheme(
              elevation: 0.0,
              backgroundColor: Color(0xff212121)
          )),
      home: DateScreen(),
    );
  }
}
