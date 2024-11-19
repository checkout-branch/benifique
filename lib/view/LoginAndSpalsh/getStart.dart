import 'package:benefique/view/LoginAndSpalsh/loginFor.dart';
import 'package:benefique/view/LoginAndSpalsh/signUp.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Getstart extends StatefulWidget {
  const Getstart({super.key});

  @override
  State<Getstart> createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Image(
                    image:
                        AssetImage('asset/animatedIOocn-removebg-preview.png')),
              ),
              Gap(20),
              Text(
                'Start Journey With',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                'Benifique Store',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
              Gap(15),
              Text(
                'Join us to celebrate stylish, comfy footwear.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Your path to extraordinary style begins here',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Gap(30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: mainBlueColor),
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.white,
                      minimumSize: Size(200, 50)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (ctx) => Login()));
                  },
                  child: Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: mainBlueColor))),
              Gap(20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: mainBlueColor),
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: mainBlueColor,
                      minimumSize: Size(200, 50)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => SignUpPage()));
                  },
                  child: Text('SignUP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: bagroundColorOFscreen)))
            ],
          ),
        ),
      ),
    );
  }
}