import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/home/binding/home_binding.dart';
import 'package:pelato_markazi/app/features/home/screen/main_screen.dart';
import 'package:pelato_markazi/app/features/order/binding/order_binding.dart';
import 'package:pelato_markazi/app/features/order/screen/order_view_screen.dart';
import 'package:pelato_markazi/app/features/salon/binding/salon_binding.dart';
import 'package:pelato_markazi/app/features/salon/screen/checkout_screen.dart';
import 'package:pelato_markazi/app/features/salon/screen/single_salon_screen.dart';
import 'package:pelato_markazi/app/features/splash/screen/intro_screen.dart';
import 'package:pelato_markazi/app/features/splash/screen/splash_screen.dart';
import 'package:pelato_markazi/app/features/user/binding/user_binding.dart';
import 'package:pelato_markazi/app/features/user/screen/login_screen.dart';
import 'package:pelato_markazi/app/features/user/screen/signup_screen.dart';

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
