import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<dynamic> menuItems = [];

  @override
  void initState() {
    super.initState();
    // Llamada a la función para obtener los datos de la API al iniciar la página.
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        'https://sushiapi-production.up.railway.app/sushi'
            as Uri); // Reemplaza 'URL_DE_TU_API' con la URL real de tu API.

    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, analiza el cuerpo de la respuesta JSON.
      final jsonData = json.decode(response.body);
      setState(() {
        menuItems = jsonData[
            '_id']; // Reemplaza 'tusDatos' con el nombre real de la propiedad que contiene tus datos en la respuesta.
      });
    } else {
      // Si la solicitud no es exitosa, maneja el error aquí.
      print('Error al cargar los datos: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and it's menu

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: Center(
          child: Text(
            'Tokyo',
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        actions: [
          // cart button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo message
                    Text(
                      'Get 32% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    // redeem button
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    ),
                  ],
                ),
                Image.asset(
                  Image.network(menuItems['image']
                          ['https://sushiapi-production.up.railway.app/sushi'])
                      as String,
                  height: 100,
                )
              ],
            ),
          ),

          const SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                hintText: "Search here..",
              ),
            ),
          ),
          const SizedBox(height: 25),
          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // Aquí puedes construir un widget para mostrar cada elemento del menú.
                return ListTile(
                  title: Text(menuItems[index]['_id']),
                  // Puedes mostrar la imagen aquí utilizando la URL de la API.
                  // Ejemplo: Image.network(menuItems[index]['url_imagen']),
                );
              },
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // popular food

          Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // iamage

                      Image.asset(
                        'lib/images/salmon_eggs.png',
                        height: 60,
                      ),
                      const SizedBox(width: 20),

                      // name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name

                          Text(
                            "Salmon Eggs",
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                          ),

                          const SizedBox(height: 10),
                          // price
                          Text(
                            '\$21.00',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ],
                  ),
                  // heart
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: 28,
                  ),
                ],
              ))
        ],
      ),
    );
  }
  // navigate to food item details page

  void navigateToFoodDetails(int index) {
    // get the shop and it's menu
  }
}
