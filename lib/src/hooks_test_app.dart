import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/routers.dart';

class HooksTestApp extends StatelessWidget {
  const HooksTestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hooks and Riverpod App',
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}
