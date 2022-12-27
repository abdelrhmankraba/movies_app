import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/tvs_modules/presentation/screens/app_layout.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movies app',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff12131C),
      ),
      home: const AppLayout(),
    );
  }
}
