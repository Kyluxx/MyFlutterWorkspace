import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/providers.dart';
import 'package:flutter_application_1/config/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: providers,
    child: MyApp()
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: RegisterView(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: '/register', 
    );
  }
}