import 'package:flutter/material.dart';
import 'package:ny_times_flutter/models/user_details_model.dart';
import 'package:ny_times_flutter/screens/home/article_details_screen.dart';
import 'package:ny_times_flutter/screens/home/popular_article_list_screen.dart';

import '../main.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static const init = '/';
  static const splash = '/splash';
  static const home = '/home';
  static const details = '/details';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.init:
      return MaterialPageRoute(
        builder: (context) => const AppInit(),
      );

    case AppRoutes.splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case AppRoutes.home:
      return MaterialPageRoute(
          builder: (context) => const PopularArticleListScreen());

    case AppRoutes.details:
      return MaterialPageRoute(
          builder: (context) =>
              ArticleDetails(article: settings.arguments as Articles));

    default:
      return MaterialPageRoute(
        builder: (context) => const AppInit(),
      );
  }
}
