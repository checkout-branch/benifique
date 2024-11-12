import 'package:benefique/screens/LoginAndSpalsh/login.dart';
import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class Getstart extends StatefulWidget {
  const Getstart({super.key});

  @override
  State<Getstart> createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              
              child: Center(
                child: Image(
                  image: AssetImage('asset/bhhhhh.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height < 300 ? 50 : 70),
                child: TextButton(
                  // style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     backgroundColor: mainBlueColor,
                  //     minimumSize: Size(90, 60)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => LoginScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textAoboshiOne2(
                        text: 'Get Started',
                        fontSizes: 20,
                        colors: mainBlueColor,
                        fontw: FontWeight.w900,
                      ),
                      Gap(10),
                      Icon(
                        Iconsax.arrow_right_1,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
