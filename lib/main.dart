import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:takehomechallenge_andyanyogawardhana/providers/home_provider.dart';
import 'package:takehomechallenge_andyanyogawardhana/utils/constants/colors.dart';
import 'package:takehomechallenge_andyanyogawardhana/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: AppColors.green,
            onPrimary: AppColors.green,
            secondary: AppColors.pink,
            onSecondary: AppColors.pink,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.white,
            onBackground: Colors.white,
            surface: Colors.black,
            onSurface: Colors.black,
          ),
          textTheme: GoogleFonts.orbitTextTheme(
            Theme.of(context).textTheme,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.darkGreen,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        debugShowCheckedModeBanner: kDebugMode,
        initialRoute: "/home",
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/home":
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
          }
          return null;
        },
      ),
    );
  }
}
