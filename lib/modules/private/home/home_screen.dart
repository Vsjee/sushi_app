import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/core/models/sushi_model.dart';
import 'package:sushi_app/core/service/sushi_service.dart';
import 'package:sushi_app/modules/private/home/widgets/home_drawer/home_drawer.dart';
import 'package:sushi_app/modules/private/home/widgets/sushi_list/sushi_list.dart';
import 'package:sushi_app/theme/app_colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  List<Sushi> getRandomElements(List<Sushi> list) {
    if (list.length < 4) {
      throw Exception('List must contain at least 4 elements');
    }

    // final random = Random();
    final shuffledList = list.toList();
    shuffledList.shuffle();

    final randomElements = shuffledList.sublist(0, 4);
    return randomElements;
  }

  void _openSushiList(
    BuildContext context,
    List<Sushi> sushis,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return SushiList(
          sushis: sushis,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sushis = ref.watch(sushiDataProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
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
      body: sushis.when(
        data: (data) {
          var filterData = getRandomElements(data);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // promo banner
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
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
                          height: 10,
                        ),
                        // redeem button
                        MyButton(
                          text: "Redeem",
                          onTap: () {},
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/sushi.png',
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
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Search here..",
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // menu list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        _openSushiList(context, data);
                      },
                      child: const Text('See more'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: filterData.length,
                  itemBuilder: (context, index) => FoodTile(
                    sushi: filterData[index],
                  ),
                ),
              ),

              // const SizedBox(
              //   height: 15,
              // ),

              // popular food
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.grey[100],
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              //   padding: const EdgeInsets.all(20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         children: [
              //           Image.asset(
              //             'assets/images/sushi.png',
              //             height: 60,
              //           ),
              //           const SizedBox(width: 20),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "Salmon Eggs",
              //                 style: GoogleFonts.dmSerifDisplay(fontSize: 18),
              //               ),
              //               const SizedBox(height: 10),
              //               Text(
              //                 '\$21.00',
              //                 style: TextStyle(color: Colors.grey[700]),
              //               )
              //             ],
              //           ),
              //         ],
              //       ),
              //       // heart
              //       const Icon(
              //         Icons.favorite_outline,
              //         color: Colors.grey,
              //         size: 28,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
