import 'package:get/get.dart';
import 'package:movies/src/bindings/home_binding.dart';
import 'package:movies/src/pages/movies/home_screen.dart';
import 'package:movies/src/pages/movies/movie_details_screen.dart';
part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.details,
      page: () => MovieDetailsScreen(),
    ),
  ];
}
