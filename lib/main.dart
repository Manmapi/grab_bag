import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grab_bag/core/base/themes/theme.dart';
import 'package:grab_bag/core/env/env.dart';
import 'package:grab_bag/features/main_screen/presentation/pages/main_screen.dart';
import 'package:grab_bag/main.config.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:grab_bag/features/main_screen/main_screen.dart' as main_screen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set mode
  await Env.setMode(EnvMode.dev);

  // Register modules
  await configureDependencies();

  await main_screen.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: lightThemeData.copyWith(
          textTheme: GoogleFonts.notoSansTextTheme(),
        ),
        darkTheme: darkThemeData.copyWith(
          textTheme: GoogleFonts.notoSansTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        themeMode: ThemeMode.light,
        home: const MainScreen(),
      );
    });
  }
}

// Dependency Injection
final getIt = GetIt.I;

@InjectableInit()
Future configureDependencies() async => await $initGetIt(
      getIt,
      environment: Environment.prod,
    );
