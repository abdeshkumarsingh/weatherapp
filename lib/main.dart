import 'package:flutter/material.dart';
import 'package:weather_app/constaints.dart';
import 'package:weather_app/provider/homepage_provider.dart';
import 'package:weather_app/screens/help_screen.dart';
import 'package:weather_app/screens/homepage_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomepageProvider>(create: (_) => HomepageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(centerTitle: true, titleTextStyle: kTitleStyle)
        ),
        initialRoute: HelpScreen.id,
        routes: {
          HelpScreen.id : (context) => const HelpScreen(),
          HomepageScreen.id : (context) => const HomepageScreen()
        },
      ),
    );
  }
}

