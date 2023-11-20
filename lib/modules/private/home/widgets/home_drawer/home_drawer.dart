import 'package:flutter/material.dart';
import 'package:sushi_app/core/service/fire_auth.dart';
import 'package:sushi_app/login_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 76, 0, 255),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1615361200141-f45040f367be?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  bottom: 0,
                  left: 0,
                  child: Text(
                    'User name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: -10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await FireAuthService().signOut();

              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.exit_to_app,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
