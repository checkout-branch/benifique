import 'package:benefique/screens/LoginAndSpalsh/signUp.dart';
import 'package:benefique/screens/bottomNavigation/bootomBar.dart';
import 'package:benefique/screens/homePage.dart';
import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController UserNameForLogin = TextEditingController();
  TextEditingController passwordForLogin = TextEditingController();

  Future<void> foLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? username = pref.getString('usernamForSignUp');
    String? password = pref.getString('passwordForSignUp');

    if (UserNameForLogin.text.isNotEmpty & passwordForLogin.text.isNotEmpty) {
      if (UserNameForLogin.text == username &&
          passwordForLogin.text == password) {
        await pref.setBool('isLogined', true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => Botoommm()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: mainBlueColor,content: Text('Invalid username or password')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          behavior: SnackBarBehavior.floating,
          elevation: 5,
          backgroundColor: mainBlueColor,
          content: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Text('Enter username & password')),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: mainBlueColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(300.0))),
                  ),
                  Positioned(
                    left: 20,
                    top: 70,
                    child: Text('Welcome back ! Glad',
                        style: GoogleFonts.aoboshiOne(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 29))),
                  ),
                  Positioned(
                    left: 20,
                    top: 110,
                    child: Text('To See you Again!',
                        style: GoogleFonts.aoboshiOne(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 25))),
                  ),
                ],
              ),
              Gap(80),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    TextFormField(
                      controller: UserNameForLogin,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                    Gap(30),
                    TextFormField(
                      controller: passwordForLogin,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'password',

                        // contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
              Row(
                children: [
                  Gap(50),
                  Text(
                    "Did'nt have a account ? ",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => SignUpPage()));
                      },
                      child: Text(
                        'SignUP',
                        style: TextStyle(fontSize: 18, color: mainBlueColor),
                      ))
                ],
              ),
              Gap(25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 20,
                    backgroundColor: mainBlueColor,
                    minimumSize: Size(150, 50)),
                onPressed: () {
                  foLogin();
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
