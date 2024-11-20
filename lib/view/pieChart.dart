import 'package:benefique/controller/prodectModals/prodectModel.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pie_chart/pie_chart.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProdect();
  }

  final List<Color> colorList = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.yellow,
  ];

  final adidas = 'Adidas';
  final converse = 'Converse';
  final newbalance = 'Newbalance';
  final puma = 'Puma';
  final nike = 'Nike';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainBlueColor,
        title: Text(
          "Pie chart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Gap(30),
          ValueListenableBuilder(
            valueListenable: prodectList,
            builder: (context, value, child) {
              final adiidas = value.where((take) => take.category == adidas);
              final conv = value.where((take) => take.category == converse);
              final nb = value.where((take) => take.category == newbalance);
              final pm = value.where((take) => take.category == puma);
              final nk = value.where((take) => take.category == nike);

              final Map<String, double> dataMap = {
                "Adidas": adiidas.length.toDouble(),
                "Converse": conv.length.toDouble(),
                "Newbalance": nb.length.toDouble(),
                "Puma": pm.length.toDouble(),
                'nike': nk.length.toDouble(),
              };
              return PieChart(
                key: Key("pie_chart"),
                dataMap: dataMap,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width / 2.2,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
              );
            },
          ),
          Gap(30),
          textAoboshiOne2(
              text: 'Prodect Details',
              fontSizes: 20,
              colors: Colors.black,
              fontw: FontWeight.bold),
          Gap(20),
          ValueListenableBuilder(
            valueListenable: prodectList,
            builder: (context, value, child) {
              var adidass =
                  value.where((getNumber) => getNumber.category == adidas);
              var newB =
                  value.where((getNumber) => getNumber.category == newbalance);
              var pumaaa =
                  value.where((getNumber) => getNumber.category == puma);
              var converese =
                  value.where((getNumber) => getNumber.category == converse);
              var nikee =
                  value.where((getNumber) => getNumber.category == nike);

              return Column(
                children: [
                  Gap(10),
                  rowFortext(
                      givename: adidass, colors: Colors.blue, name: 'Adidas'),
                  rowFortext(
                      givename: converese,
                      colors: Colors.orange,
                      name: 'Converse'),
                  rowFortext(
                      givename: newB, colors: Colors.green, name: 'Newbalance'),
                  rowFortext(
                      givename: pumaaa, colors: Colors.red, name: 'Puma'),
                  rowFortext(
                      givename: nikee, colors: Colors.yellow, name: 'Nike'),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Container rowFortext(
      {required Iterable<Prodectmodel> givename,
      required String name,
      required Color colors}) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textAoboshiOne2(
              text: '$name:',
              fontSizes: 18,
              colors: Colors.black,
              fontw: FontWeight.bold),
          Gap(20),
          textAoboshiOne2(
              text: givename.length.toString(),
              fontSizes: 20,
              colors: colors,
              fontw: FontWeight.bold)
        ],
      ),
    );
  }
}
