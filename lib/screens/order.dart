import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
               Gap(15),
               Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Order",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Iconsax.heart5,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
               Gap(50),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Container(
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                  width: double.infinity,
                  child: Container(
                      margin:  EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Gap(50),
                          Row(
                            children: [
                              textAoboshiOne2(
                                  text: 'Add Delivery Address',
                                  fontSizes: 20,
                                  colors: Colors.black87,
                                  fontw: FontWeight.bold),
                               Gap(5),
                               Icon(Iconsax.location_add)
                            ],
                          ),
                           Gap(30),
                          textFeilds(
                              name: 'Name',
                              iconName: Icons.person,
                              controllName: ''),
                           Gap(20),
                          textFeilds(
                              keybordtype: TextInputType.number,
                              name: 'Number',
                              iconName: Icons.person,
                              controllName: ''),
                           Gap(20),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: textFeilds(
                                      name: 'Pincode',
                                      iconName: Iconsax.location_tick5,
                                      controllName: ''),
                                ),
                              ),
                               Gap(10),
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: textFeilds(
                                      name: 'State',
                                      iconName: Iconsax.global_search4,
                                      controllName: ''),
                                ),
                              )
                            ],
                          ),
                           Gap(20),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: textFeilds(
                                      name: 'City',
                                      iconName: Iconsax.dollar_circle,
                                      controllName: ''),
                                ),
                              ),
                               Gap(10),
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: textFeilds(
                                      name: 'House Name',
                                      iconName: Iconsax.home_12,
                                      controllName: ''),
                                ),
                              )
                            ],
                          ),
                           Gap(20),
                          textFeilds(
                              name: 'Housename or Building name',
                              iconName: Iconsax.building4,
                              controllName: ''),
                           Gap(20),
                          Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: mainBlueColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {},
                                  child:  Text(
                                    'Save & Order',
                                    style: TextStyle(color: Colors.white),
                                  )))
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
