import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vezeeta_flutter/constants.dart';
import 'package:vezeeta_flutter/screens/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        platform: TargetPlatform.iOS,
      ),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar", "AE")],
      locale: Locale("ar", "AE"),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
