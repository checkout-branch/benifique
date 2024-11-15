import 'dart:io';
import 'package:benefique/controller/cartFunction/cartFunction.dart';
import 'package:benefique/controller/prodectModals/prodectModel.dart';
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
  TextEditingController searchController = TextEditingController();
  String search = '';
  List<Prodectmodel> searchResult = [];

  @override
  void initState() {
    super.initState();
    getAllProdect();
    filteredListOfProduct('All');
    searchListUpdate();
  }

  void searchListUpdate() {
    setState(() {
      if (search.isEmpty) {
        searchResult = filterlist.value;
      } else {
        searchResult = filterlist.value
            .where((product) =>
                product.itemname!.toLowerCase().contains(search.toLowerCase()))
            .toList();
      }
    });
  }

  int currentIndex = 0;

  final shoesForAllCategories = [
    'All',
    'Adidas',
    'Converse',
    'New Balance',
    'Puma',
    'Nike'
  ];

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
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  search = value;
                  searchListUpdate();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Search products',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: Icon(Iconsax.search_normal_1),
                ),
              ),
            ),
            Gap(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                itemCount: shoesForAllCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        filteredListOfProduct(shoesForAllCategories[index]);
                        searchListUpdate();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: currentIndex != index ? 90 : 100,
                      decoration: BoxDecoration(
                        color: mainBlueColor,
                        borderRadius: currentIndex == index
                            ? BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))
                            : BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          shoesForAllCategories[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: currentIndex == index ? 17 : 15,
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
              child: GridForAllProdect(productList: searchResult),
            ),
          ],
        ),
      ),
    );
  }
}

Widget GridForAllProdect({required List<Prodectmodel> productList}) {
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
      final getDatass = productList[index];
      return GestureDetector(
        onLongPress: () {
          deleteProdect(index);
        },
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ViewProdect(
                imagepath: File(getDatass.images ?? ''),
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
                      image: FileImage(File(getDatass.images ?? '')),
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
                        onTap: () {
                          saveCartItem(getDatass);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.white,
                              content: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 70,
                                    child: Image(
                                        image: AssetImage(
                                            'asset/Animation - 1731646779762 (1).gif')),
                                  ),
                                  Gap(10),
                                  textAoboshiOne2(
                                      text: 'Added to cart',
                                      fontSizes: 18,
                                      colors: Colors.black,
                                      fontw: FontWeight.bold)
                                ],
                              )));
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    itemCount: productList.length,
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
