import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final List<String> choseThebrand = [
    'Adidas',
    'Converse',
    'New Balance',
    'Puma',
    'Nike',
    'Other',
  ];
  List<String> districtsOfKerala = [
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kannur',
    'Kasaragod',
    'Kollam',
    'Kottayam',
    'Kozhikode',
    'Malappuram',
    'Palakkad',
    'Pathanamthitta',
    'Thiruvananthapuram',
    'Thrissur',
    'Wayanad',
  ];

  String? selectedBrand;
  String? selectedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      appBar: AppBar(
        backgroundColor: mainBlueColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'Edit your Prodect',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 180,
                    width: 200,
                    child: Card(
                      elevation: 5,
                      color: const Color(0xffd9d9d9),
                      child: rowForImage(name: 'Add image'),
                    ),
                  ),
                   const Gap(10),
                  Column(
                    children: [
                      SizedBox(
                        height: 85,
                        width: 200,
                        child: Card(
                          elevation: 5,
                          color: const Color(0xffd9d9d9),
                          child: rowForImage(name: 'Add image'),
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        
                        height: 85,
                        width: 200,
                        child: Card(
                          elevation: 5,
                          color: const Color(0xffd9d9d9),
                          child: rowForImage(name: 'Add image'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 180,
                    width: 200,
                    child: Card(
                      elevation: 5,
                      color: const Color(0xffd9d9d9),
                      child: rowForImage(name: 'Add image2 \nanother color'),
                    ),
                  ),
                  const Gap(10),
                  Column(
                    children: [
                      SizedBox(
                        height: 85,
                        width: 200,
                        child: Card(
                          elevation: 5,
                          color: const Color(0xffd9d9d9),
                          child: rowForImage(name: 'Add image'),
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        height: 85,
                        width: 200,
                        child: Card(
                          elevation: 5,
                          color: const Color(0xffd9d9d9),
                          child: rowForImage(name: 'Add image'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    'ADD 2 -4  images to sell faster',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Gap(15),
                  Icon(Iconsax.truck_fast),
                ],
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      fillColor: const Color(0xffd9d9d9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          padding: const EdgeInsets.only(left: 10),
                          hint: const Text('Chose the brand'),
                          value: selectedBrand,
                          items: choseThebrand
                              .map<DropdownMenuItem<String>>((String ele) {
                            return DropdownMenuItem(
                                value: ele, child: Text(ele));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedBrand = value;
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  textFeilds(
                      name: 'Name of item',
                      iconName: Icons.abc,
                      controllName: ''),
                  const Gap(25),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: textFeilds(
                              name: 'Your price',
                              iconName: Iconsax.dollar_circle,
                              controllName: ''),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: textFeilds(
                              name: 'Current price',
                              iconName: Iconsax.dollar_circle,
                              controllName: ''),
                        ),
                      )
                    ],
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      SizedBox(
                        height: 55,
                        width: 130,
                        child: textFeilds(
                            name: 'Discount',
                            iconName: Iconsax.discount_shape,
                            controllName: ''),
                      ),
                      const Gap(10),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: textFeilds(
                              name: 'Country',
                              iconName: Icons.place,
                              controllName: ''),
                        ),
                      )
                    ],
                  ),
                  const Gap(15),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      fillColor: const Color(0xffd9d9d9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          padding: const EdgeInsets.only(left: 10),
                          hint: const Text('Select Yout State'),
                          value: selectedState,
                          items: districtsOfKerala
                              .map<DropdownMenuItem<String>>((String ele) {
                            return DropdownMenuItem(
                                value: ele, child: Text(ele));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedState = value;
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: mainBlueColor,
                    minimumSize: const Size(150, 50)),
                onPressed: () {},
                child: const Text(
                  'Eit Your Prodect',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

  Row rowForImage({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        const Gap(10),
        const Icon(
          Iconsax.gallery_add,
          color: Colors.black54,
        )
      ],
    );
  }
}
