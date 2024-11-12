import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Gap(20),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 13,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Iconsax.arrow_left,
                        color: Colors.white,
                        weight: 20,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cart",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 15,
                    top: 10,
                    child: Icon(
                      Iconsax.heart5,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Gap(50),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(30),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 100,
                              child: Card(
                                color: const Color(0xffFBFCF8),
                                elevation: 5,
                                child: Center(
                                  child: ListTile(
                                    leading: SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'asset/459718128_1192585765505177_3114789471614213053_n.jpg',
                                          fit: BoxFit.cover,
                                          // height: 100,
                                          // width: 80,
                                        ),
                                      ),
                                    ),
                                    title: const Text('adidas forum low'),
                                    subtitle: const Text('rinshid'),
                                    trailing: const Icon(Icons.delete),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const Gap(50),
                        priceOfCart(name: 'SubTotal', price: '90909'),
                        const Gap(3),
                        priceOfCart(name: 'Delivery Charge', price: '90909'),
                        const Gap(3),
                        priceOfCart(name: 'Tax', price: '90909'),
                        const Gap(3),
                        const Divider(),
                        priceOfCart(
                          name: 'Total',
                          price: '99999',
                        ),
                        const Gap(35),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainBlueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(100, 50),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Check Out',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Gap(20)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
