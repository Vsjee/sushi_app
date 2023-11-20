import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/core/models/sushi_model.dart';
import 'package:sushi_app/modules/private/food_details/widgets/bottom_pricing.dart';

class FoodDetails extends StatelessWidget {
  final Sushi sushi;

  const FoodDetails({super.key, required this.sushi});

  String toUtf8(String text) {
    return utf8.decode(text.codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    var sushiOrigin = toUtf8(sushi.sushiOrigin);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.network(sushi.image),
                const SizedBox(height: 25),
                _title(),
                const SizedBox(height: 25),
                _description(sushiOrigin),
                const SizedBox(height: 25),
                _ingredients(),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomPricing(
        sushi: sushi,
      ),
    );
  }

  Widget _description(String sushiOrigin) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            sushiOrigin,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sushi.sushiName,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 45,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow[800],
              ),
              Text(
                sushi.rating.toString(),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ingredients() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ...sushi.ingredients
              .map((element) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            element.ingredientName,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                              height: 2,
                            ),
                          ),
                          Text(
                            '${element.calories.toString()} calories',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 2,
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
              .toList(),
        ],
      ),
    );
  }
}
