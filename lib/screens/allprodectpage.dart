import 'dart:io';

import 'package:benefique/database/prodectModals/prodectModel.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/screens/viewProdect.dart';
import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class AllprodectPage extends StatefulWidget {
  const AllprodectPage({super.key});

  @override
  State<AllprodectPage> createState() => _AllprodectPageState();
}

class _AllprodectPageState extends State<AllprodectPage> {
  final shoesForAllCatogeres = [
    'All',
    'Adidas',
    'Converse',
    'New Balance',
    'Puma',
    'Nike'
  ];

  final pagesOfTab = List<Widget>.generate(
    6,
    (index) => GridForAllProdect(index: index),
  );

  int curruntIndex = 0;

  @override
  void initState() {
    super.initState();
    getAllProdect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      appBar: AppBar(
        backgroundColor: bagroundColorOFscreen,
        title: Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Iconsax.heart5),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: textFeilds(
                name: 'Search Prodects',
                iconName: Icons.search,
                controllName: '',
              ),
            ),
            Gap(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                itemCount: shoesForAllCatogeres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        curruntIndex = index;
                        filteredListOfProduct(shoesForAllCatogeres[index]);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: curruntIndex != index ? 90 : 100,
                      decoration: BoxDecoration(
                        color: mainBlueColor,
                        borderRadius: curruntIndex == index
                            ? BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))
                            : BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          shoesForAllCatogeres[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: curruntIndex == index ? 17 : 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Gap(15),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 200,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: pagesOfTab[curruntIndex],
            ),
          ],
        ),
      ),
    );
  }
}

Widget GridForAllProdect({required int index}) {
  return ValueListenableBuilder(
    valueListenable: filterlist,
    builder: (context, List<Prodectmodel> valuesOfProduct, child) {
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 9,
          crossAxisSpacing: 9,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final getDatass = valuesOfProduct[index];

          return GestureDetector(
            onLongPress: () {
              deleteStudent(index);
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ViewProdect(
                    titleName: getDatass.itemname,
                    discount: getDatass.discound,
                    price: getDatass.yourPrice,
                    brand: getDatass.modal,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 165,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: FileImage(File(getDatass.images.toString())),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: textAoboshiOne2(
                        text: getDatass.itemname.toString(),
                        fontSizes: 17,
                        colors: Colors.black87,
                        fontw: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          textAoboshiOne2(
                            text: getDatass.yourPrice.toString(),
                            fontSizes: 17,
                            colors: Colors.black87,
                            fontw: FontWeight.bold,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Iconsax.shopping_cart,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: valuesOfProduct.length,
      );
    },
  );
}

void filteredListOfProduct(String category) {
  final prod = prodectList.value;
  if (category == 'All') {
    filterlist.value = prod;
  } else {
    filterlist.value =
        prod.where((product) => product.category == category).toList();
  }
}
