import 'package:flutter/material.dart';
import 'package:list_me/screens/analysis/catagory_page.dart';
import 'package:list_me/services/api.dart';
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
      catname: 'Fruit',
      price: 665,
      urlAvatar: 'assets/images/catagory/fruits.png',
    ),
    const Catagory(
      catname: 'Vegetable',
      price: 300,
      urlAvatar: 'assets/images/catagory/vegetable.png',
    ),
    const Catagory(
      catname: 'Toiletries',
      price: 250,
      urlAvatar: 'assets/images/catagory/health_and_beauty.png',
    ),
    const Catagory(
      catname: 'Rice',
      price: 220,
      urlAvatar: 'assets/images/catagory/rice.png',
    ),
    const Catagory(
      catname: 'Dairy',
      price: 150,
      urlAvatar: 'assets/images/catagory/dairy.png',
    ),
    const Catagory(
      catname: 'Bakery',
      price: 80,
      urlAvatar: 'assets/images/catagory/bakery.png',
    ),
    const Catagory(
      catname: 'Meats',
      price: 700,
      urlAvatar: 'assets/images/catagory/meats.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25.0,
          ),
          FutureBuilder(
              future: Api.getListTotal(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (!snapshot.hasData) {
                  return Text('You have no any lists to show');
                } else {
                  double total = snapshot.data!.toDouble();
                  print(total);
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Total Cost',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          Text(
                            "Rs. ${total.toString()}",
                            style: TextStyle(
                              fontSize: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: 350,
                    height: 100,
                    decoration: ShapeDecoration(
                        color: Color(0x7FD4D4D4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  );
                }
              }),
          SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<CatData, String>(
                dataSource: _chartData,
                xValueMapper: (CatData data, _) => data.item,
                yValueMapper: (CatData data, _) => data.price,
                //dataLabelSettings: DataLabelSettings(isVisible: true)
              ),
            ],
            legend: Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoryPage()));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            category.urlAvatar,
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60))),
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
      ),
    );
  }

  List<CatData> getChartData() {
    final List<CatData> chartData = [
      CatData('Fruit', 665),
      CatData('Vegetable', 300),
      CatData('Toiletries', 250),
      CatData('Rice', 220),
      CatData('Dairy', 150),
      CatData('Bakery', 80),
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
