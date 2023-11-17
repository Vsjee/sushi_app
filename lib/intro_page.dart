import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 0, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),
              //shop name
              Text(
                "SUSHI ",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25),

              //icon
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                child: Image.asset(
                  'assets/images/sushi.png',
                  width: 300,
                  height: 300,
                ),
              ),

              //title
              Text(
                "THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              //subtitle
              Text(
                "Feel the taste of the most popular Japanese food for anywhere and anytime ",
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 2,
                ),
              ),

              const SizedBox(height: 10),

              // get started button
              MyButton(
                text: "GET STARTED",
                onTap: () {
                  //go to login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
