import 'package:flutter/material.dart';

import '../view/page/home_screen.dart';
import '../view/page/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
