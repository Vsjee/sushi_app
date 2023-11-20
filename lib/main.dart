import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi_app/intro_page.dart';
import 'package:sushi_app/login_page.dart';
import 'package:sushi_app/modules/private/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sushi_app/sing_up.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple).copyWith(
        primaryColor: const Color.fromARGB(255, 76, 0, 255),
      ),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/loginpage': (context) => const LoginPage(),
        '/singup': (context) => const Singup(),
        '/MenuPage': (context) => const HomeScreen()
      },
    );
  }
}
