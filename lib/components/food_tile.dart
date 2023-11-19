import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/core/models/sushi_model.dart';

class FoodTile extends StatelessWidget {
  final Sushi sushi;

  const FoodTile({super.key, required this.sushi});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                sushi.image,
                height: MediaQuery.of(context).size.height - 450,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sushi.sushiName,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$${sushi.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
