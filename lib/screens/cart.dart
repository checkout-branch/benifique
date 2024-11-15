import 'dart:io';

import 'package:benefique/controller/cartFunction/cartFunction.dart';
import 'package:benefique/modal/cartModal/cartModal.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  List<Prodectmodel> cartItemsOfEach;

  CartPage({super.key, required this.cartItemsOfEach});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    getAllCart();
  }

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
                    padding: const EdgeInsets.only(left: 13),
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
                        Gap(30),
                        ValueListenableBuilder(
                          valueListenable: cartlisterner,
                          builder: (context, List<StoreCart> cartStoredItems, child) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cartStoredItems.length,
                              itemBuilder: (context, index) {
                                final items = cartStoredItems[index];
                                return SizedBox(
                                  height: 100,
                                  child: Card(
                                    color: const Color(0xffFBFCF8),
                                    elevation: 5,
                                    child: Center(
                                      child: ListTile(
                                        leading: Container(
                                          height: 80,
                                          width: 80,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: (items.image != null )
                                              ? Image.file(
                                                  File(items.image!),
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  'asset/pumaHo-removebg-preview.png',
                                                  fit: BoxFit.cover,
                                                ),
                                          ),
                                        ),
                                        title: Text(items.itemsName.toString()),
                                        subtitle: Text(items.price.toString()),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            deleteCart(index);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
