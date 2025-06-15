import 'package:ReciTracker/l10n/app_localizations.dart';
import 'package:ReciTracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ReciclajeApp extends StatelessWidget {
  const ReciclajeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoTrack',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('es'), // Español de España
        Locale('en'), // Inglés de Estados Unidos
      ],
      theme: ThemeData(
        useMaterial3: true, // ¡ACTIVA MATERIAL 3!
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50), // Color semilla (verde ecológico)
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}