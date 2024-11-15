
import 'package:benefique/screens/allProdectPage.dart';
import 'package:benefique/screens/homePage.dart';
import 'package:benefique/screens/pieChart.dart';
import 'package:benefique/screens/profilPage.dart';
import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Botoommm extends StatefulWidget {
  Botoommm({
    super.key,
  });

  @override
  State<Botoommm> createState() => _BotoommmState();
}

class _BotoommmState extends State<Botoommm> {
  var curruntIndex = 0;

  final List<Widget> pagesOfBottom = [
    HomePage(),
  AllprodectPage(),
    Dashbord(),
    ProfileP(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      body: pagesOfBottom[curruntIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: mainBlueColor,
        height: 60,
        buttonBackgroundColor: mainBlueColor,
        backgroundColor: Colors.transparent, 
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeIn,
        items: [
          curruntIndex == 0
              ? ImageIcon(
                  AssetImage('asset/Animation - 1731057393892.gif'),
                  size: 35,
                  color: curruntIndex == 1 ? Colors.white : Colors.white,
                )
              : ImageIcon(AssetImage('asset/3d-house.png'),
                  size: 30, color: Colors.white),
          curruntIndex == 1
              ? ImageIcon(
                  AssetImage('asset/Animation - 1731058757966.gif'),
                  size: 40,
                  color: curruntIndex == 2 ? Colors.white : Colors.white,
                )
              : ImageIcon(AssetImage('asset/shoes.png'),
                  size: 30, color: Colors.white),
          curruntIndex == 2
              ? ImageIcon(
                  AssetImage(
                    'asset/Animation - 1731060075754.gif',
                  ),
                  size: 35,
                  color: curruntIndex == 3 ? Colors.white : Colors.white,
                )
              : ImageIcon(AssetImage('asset/bar-graph.png'),
                  size: 30, color: Colors.white),
          curruntIndex == 3
              ? ImageIcon(
                  AssetImage('asset/Animation - 1731059288713.gif'),
                  size: 35,
                  color: curruntIndex == 4 ? Colors.white : Colors.white,
                )
              : Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
        ],
        onTap: (value) {
          setState(() {
            curruntIndex = value;
          });
        },
      ),
    );
  }
}
