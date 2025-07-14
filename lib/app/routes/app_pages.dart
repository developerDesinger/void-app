import 'package:get/get.dart';

import '../../presentation/loacked_app/bindings/locked_app_binding.dart';
import '../../presentation/loacked_app/views/locked_app_view.dart';
import '../../presentation/main/bindings/main_binding.dart';
import '../../presentation/main/views/main_view.dart';
import '../../presentation/settings/bindings/settings_binding.dart';
import '../../presentation/settings/views/settings_view.dart';
import '../../presentation/splash/bindings/splash_binding.dart';
import '../../presentation/splash/views/splash_view.dart';
import '../../presentation/statistics/bindings/statistics_binding.dart';
import '../../presentation/statistics/views/statistics_view.dart';
import '../../presentation/void/bindings/void_binding.dart';
import '../../presentation/void/views/void_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOCKED_APP,
      page: () => const LockedAppView(),
      binding: LockedAppBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => const StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.VOID,
      page: () => const VoidView(),
      binding: VoidBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
