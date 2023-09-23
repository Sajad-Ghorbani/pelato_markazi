import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/config/theme/app_theme.dart';
import 'package:pelato_markazi/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => Services().init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'پلاتو مرکزی',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
      locale: const Locale('fa', 'IR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''),
        Locale('en', ''),
      ],
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 200),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        return widget!;
      },
    );
  }
}

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errorDetails});

  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kDebugMode ? errorDetails.summary.toString() : 'خطایی رخ داده است!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kDebugMode ? Colors.red : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            kDebugMode
                ? 'https://docs.flutter.dev/testing/errors'
                : "ما با خطایی مواجه شدیم و تیم مهندسی خود را در مورد آن مطلع کردیم. پوزش بابت ناراحتی پیش آمده",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
