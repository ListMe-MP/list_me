import 'package:flutter/material.dart';
import 'package:list_me/screens/analysis/catagory_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<CatData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  List<Catagory> catagorys = [
    const Catagory(
      catname: 'Grosery',
      price: 5125,
      urlAvatar: '',
    ),
    const Catagory(
      catname: 'Cosmatics',
      price: 2750,
      urlAvatar: '',
    ),
    const Catagory(
      catname: 'Fruit',
      price: 2250,
      urlAvatar: '',
    ),
    const Catagory(
      catname: 'Vegetable',
      price: 1375,
      urlAvatar: '',
    ),
    const Catagory(
      catname: 'Meat',
      price: 1000,
      urlAvatar: '',
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        SizedBox(
        height: 25.0,
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Total Monthly Cost',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Text(
                'LKR 12500.00',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ],
          ),
        ),
        width: 350,
        height: 90,
        decoration: ShapeDecoration(
            color: Color(0x7FD4D4D4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),

      
      SfCircularChart(
        series: <CircularSeries>[
          DoughnutSeries<CatData, String>(
            dataSource: _chartData,
            xValueMapper: (CatData data, _) => data.item,
            yValueMapper: (CatData data, _) => data.price,
            //dataLabelSettings: DataLabelSettings(isVisible: true)
          ),
        ],
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0X7fd4d4d4)),
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: catagorys.length,
            itemBuilder: (BuildContext context, int index) {
              final category = catagorys[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CategoryPage()));
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.amber,
                    ),
                    title: Text(category.catname),
                    subtitle: Text('LKR ' + category.price.toString()),
                    trailing: const Icon(Icons.arrow_forward),

                    // onTap: (){
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //     builder: CatagoryPage())
                    //   ),
                    // },
                  ),
                ),
              );
            },
          ),
        ),
      ),
      ],
      
    );
  }

  List<CatData> getChartData() {
    final List<CatData> chartData = [
      CatData('Grosery', 5125),
      CatData('Cosmatics', 2750),
      CatData('Fruit', 2250),
      CatData('Vegetable', 1375),
      CatData('Meat', 1000),
    ];
    return chartData;
  }
}

class CatData {
  CatData(this.item, this.price);
  final String item;
  final int price;
}

class Catagory {
  final String catname;
  final double price;
  final String urlAvatar;

  const Catagory({
    required this.catname,
    required this.price,
    required this.urlAvatar,
  });
}
