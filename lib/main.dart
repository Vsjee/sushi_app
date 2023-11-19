import 'package:flutter/material.dart';
import 'package:sushi_app/intro_page.dart';
import 'package:sushi_app/login_page.dart';
import 'package:sushi_app/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        '/MenuPage': (context) => const MenuPage()
      },
    );
  }
}
