// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod_test/src/view/page/home_screen.dart';

//
// Hooks not working with this case...
//
// class SplashPage extends HookWidget {
//   const SplashPage({super.key});
//   Timer timeoutForSplashScreen(BuildContext context) {
//     return Timer(
//       const Duration(seconds: 1),
//       terminateSplashScreen(context) as void Function(),
//     );
//   }

//   Future terminateSplashScreen(BuildContext context) async {
//     await pushPageReplacement(
//       context,
//       const HomeScreen(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     useEffect(() {
//       timeoutForSplashScreen(context);
//     }, const []);
//     return Container();
//   }
// }

///
///
///
///
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () async => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("This is the splash screen")));
  }
}
