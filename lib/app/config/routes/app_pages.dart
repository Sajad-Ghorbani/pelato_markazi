import 'package:get/get.dart';
import 'package:pelato_markazi/presentation/controller/home/home_binding.dart';
import 'package:pelato_markazi/presentation/pages/home/main_screen.dart';
import 'package:pelato_markazi/presentation/controller/order/order_binding.dart';
import 'package:pelato_markazi/presentation/pages/order/order_view_screen.dart';
import 'package:pelato_markazi/presentation/controller/salon/salon_binding.dart';
import 'package:pelato_markazi/presentation/pages/salon/checkout_screen.dart';
import 'package:pelato_markazi/presentation/pages/salon/single_salon_screen.dart';
import 'package:pelato_markazi/presentation/pages/splash/intro_screen.dart';
import 'package:pelato_markazi/presentation/controller/user/user_binding.dart';
import 'package:pelato_markazi/presentation/pages/splash/splash_screen.dart';
import 'package:pelato_markazi/presentation/pages/user/login_screen.dart';
import 'package:pelato_markazi/presentation/pages/user/signup_screen.dart';

part './app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const MainScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.introScreen,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => const SignUpScreen(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.singleSalonScreen,
      page: () => const SingleSalonScreen(),
      binding: SalonBinding(),
    ),
    GetPage(
      name: Routes.checkoutScreen,
      page: () => const CheckoutScreen(),
      binding: SalonBinding(),
    ),
    GetPage(
      name: Routes.orderViewScreen,
      page: () => const OrderViewScreen(),
      binding: OrderBinding(),
    ),
  ];
}
