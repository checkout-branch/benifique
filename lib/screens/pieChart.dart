import 'package:benefique/screens/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  final Map<String, double> dataMap = {
    "Adidas": 25,
    "Converse": 15,
    "Newbalance": 15,
    "Puma": 10,
    'nike': 15,
  };

  final List<Color> colorList = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainBlueColor,
        title:  Text("Pie chart",style: TextStyle(color: Colors.white),),
        
      ),
      body: PieChart(
        key:  Key("pie_chart"),
        dataMap: dataMap,
        colorList: colorList,
        chartRadius: MediaQuery.of(context).size.width / 2.2,
        legendOptions:  LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions:  ChartValuesOptions(
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          decimalPlaces: 1,
        ),
      ),
    );
  }
}
