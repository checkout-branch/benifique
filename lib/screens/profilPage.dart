import 'package:benefique/screens/cart.dart';
import 'package:benefique/screens/editPage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';

class ProfileP extends StatefulWidget {
  @override
  State<ProfileP> createState() => _ProfilePState();
}

class _ProfilePState extends State<ProfileP> {
  String username = 'Guest';
  String password = '';

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  void _fetchUsername() async {
    var box = await Hive.openBox('userBox');
    setState(() {
      username = box.get('username', defaultValue: 'Guest');
      password = box.get('phonenumber', defaultValue: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Replace with your background color
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Gap(20),
          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Colors.blue, // Replace with your main color
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Gap(10),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  password,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Gap(25),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue, // Replace with your main color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Gap(15),
                    _buildListTile(
                      leading: Iconsax.profile_circle5,
                      traill: Iconsax.arrow_right,
                      text: 'Edit Profile',
                    ),
                    Gap(10),
                    _buildListTile(
                      leading: Iconsax.heart5,
                      traill: Iconsax.arrow_right,
                      text: 'Wishlist',
                    ),
                    Gap(10),
                    _buildListTile(
                      leading: Iconsax.edit,
                      traill: Iconsax.arrow_right,
                      text: 'Edit Your Product',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => EditPage()));
                      },
                    ),
                    _buildListTile(
                      leading: Iconsax.shopping_cart5,
                      traill: Iconsax.arrow_right,
                      text: 'Cart',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => CartPage()));
                      },
                    ),
                    Gap(10),
                    _buildListTile(
                      leading: Iconsax.location,
                      traill: Iconsax.arrow_right,
                      text: 'Order Address',
                    ),
                    Gap(10),
                    _buildListTile(
                      leading: Iconsax.logout5,
                      traill: Iconsax.arrow_right,
                      text: 'Logout',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile({
    required IconData leading,
    required IconData traill,
    required String text,
    void Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leading,
        color: Colors.white,
        size: 30,
      ),
      trailing: Icon(
        traill,
        color: Colors.white,
        size: 25,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
