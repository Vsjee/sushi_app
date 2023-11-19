import 'package:flutter/material.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/core/models/sushi_model.dart';
import 'package:sushi_app/theme/app_colors.dart';

class BottomPricing extends StatefulWidget {
  final Sushi sushi;

  const BottomPricing({super.key, required this.sushi});

  @override
  State<BottomPricing> createState() => _BottomPricingState();
}

class _BottomPricingState extends State<BottomPricing> {
  int quantityCount = 1;
  int totalPrice = 0;

  void decrementState() {
    setState(() {
      quantityCount--;
      totalPrice -= widget.sushi.price;

      if (quantityCount <= 0) {
        openSnackbar('To the next time houston 🧑‍🚀🐟');
        quantityCount = 0;
        totalPrice = 0;
      }
    });
  }

  void incrementState() {
    setState(() {
      if (quantityCount == 10) {
        openSnackbar('Limit reached houston 🧑‍🚀🐟');
        quantityCount = 10;
      } else {
        quantityCount++;
        totalPrice += widget.sushi.price;
      }
    });
  }

  void openSnackbar(String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(label: 'close', onPressed: () {}),
      ),
    );
  }

  void addToCart() {}

  @override
  void initState() {
    super.initState();
    setState(() {
      totalPrice = widget.sushi.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x00000000).withOpacity(1),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: -5,
            ),
          ]),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${totalPrice.toString()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(74, 0, 0, 0),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: decrementState,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    quantityCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(74, 0, 0, 0),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: incrementState,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          MyButton(text: 'Add to cart', onTap: addToCart),
        ],
      ),
    );
  }
}
