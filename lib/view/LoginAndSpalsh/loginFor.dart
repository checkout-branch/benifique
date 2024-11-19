import 'package:benefique/view/LoginAndSpalsh/signUp.dart';
import 'package:benefique/view/bottomNavigation/bt.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var iconVisible = Icons.visibility_off;
  bool isVisbel = true;
  // ignore: non_constant_identifier_names
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
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (ctx) => const Navigationpage()));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 300),
            backgroundColor: mainBlueColor,
            content: Text('Invalid username or password')));
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: bagroundColorOFscreen,
                  child: Image(
                    image: AssetImage('asset/loginn-removebg-preview.png'),
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 30,
                  child: Text('Welcome back ! Glad',
                      style: GoogleFonts.aoboshiOne(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 23))),
                ),
                Positioned(
                  top: 90,
                  left: 30,
                  child: Text('To See you Again!',
                      style: GoogleFonts.aoboshiOne(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 20))),
                ),
              ],
            ),
            textAoboshiOne2(
                text: 'Login',
                fontSizes: 25,
                colors: Colors.black,
                fontw: FontWeight.w900),
            Container(
              height: 250,
              margin: EdgeInsets.only(left: 35, right: 35, top: 25),
              child: Column(
                children: [
                  TextFormField(
                    controller: UserNameForLogin,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      label: textAoboshiOne2(
                          text: 'Login',
                          fontSizes: 15,
                          colors: Colors.black,
                          fontw: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.person),
                    ),
                  ),
                  Gap(25),
                  TextFormField(
                    controller: passwordForLogin,
                    obscureText: isVisbel,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      label: textAoboshiOne2(
                          text: 'Password',
                          fontSizes: 15,
                          colors: Colors.black,
                          fontw: FontWeight.normal),

                      // contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisbel = !isVisbel;
                              iconVisible = isVisbel
                                  ? Icons.visibility
                                  : Icons.visibility_off;
                            });
                          },
                          icon: Icon(iconVisible)),
                    ),
                  ),
                  Row(
                    children: [
                      Gap(20),
                      Text(
                        "Did'nt have a account ? ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => SignUpPage()));
                          },
                          child: Text(
                            'SignUP',
                            style:
                                TextStyle(fontSize: 16, color: mainBlueColor),
                          ))
                    ],
                  ),
                  Gap(20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          backgroundColor: mainBlueColor),
                      onPressed: () {
                        foLogin();
                      },
                      child: textAoboshiOne2(
                          text: "Login",
                          fontSizes: 20,
                          colors: Colors.white,
                          fontw: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
