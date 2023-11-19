import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/core/models/sushi_model.dart';
import 'package:sushi_app/modules/private/food_details/food_details.dart';

class SushiList extends StatelessWidget {
  final List<Sushi> sushis;

  const SushiList({super.key, required this.sushis});

  void navigateToFoodDetails(BuildContext context, Sushi sushi) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => FoodDetails(
          sushi: sushi,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.935,
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: sushis
            .map(
              (item) => InkWell(
                borderRadius: BorderRadius.circular(20),
                onLongPress: () {
                  navigateToFoodDetails(context, item);
                },
                onTap: () {
                  navigateToFoodDetails(context, item);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          item.image,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.sushiName,
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '\$${item.price}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
