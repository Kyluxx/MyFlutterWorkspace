import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/login_view.dart';
import '../views/register_view.dart';

final Map<String, Widget Function(BuildContext)> routeMap = {
  // '/': (context) => const SplashScreenPage(),
  '/login': (context) => const LoginView(),
  '/register': (context) => const RegisterView(),
};

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = routeMap[settings.name];

    if (builder != null) {
      return MaterialPageRoute(
        builder: builder,
        settings: settings,
      );
    }

    // default: 404
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            '404 Not Found\nRoute: "${settings.name}"',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
