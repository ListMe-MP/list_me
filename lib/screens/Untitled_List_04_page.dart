import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/screens/create_list.dart';

// import '../components/background.dart';
import '../components/background.dart';
import '../components/colors.dart';
import '../components/top_bar.dart';
import '../services/api.dart';
import '../utils/navigationMenu.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CheckList04 extends StatefulWidget {
  Map<String, dynamic> data;
  double amount;
  CheckList04({super.key, required this.data, required this.amount});

//    final List<Map<String, dynamic>> foodItem = [
//     ...data,

//     // ... Add more items here
// ];

  // List<String>foodItems = [
  //   'Suger 1kg',
  //   'Fresh milk',
  //   'White Chocolate',
  //   'Vanila',
  //   'Ice Cream',
  //   'Baking Soda',
  // ];

  @override
  State<CheckList04> createState() => _CheckList04State();
}

class _CheckList04State extends State<CheckList04> {
  double listamount = 0.0;
  double total = 0.0;
  double remaining = 0.0;

  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    // getTitleFromServer();
    listamount = widget.amount;
    remaining = widget.amount;
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data['lTitle'],
          style: TextStyle(color: tc1),
          textAlign: TextAlign.justify,
        ),
        backgroundColor: tc4,
        foregroundColor: tc1,
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TopBar(
                  onToggle: (index) {
                    print('switched to:$index');
                  },
                  onMenuItemSelected: (item) => onSelected(context, item),
                ),
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    // Text(
                    //   'Your Current Amount Rs.${widget.amount}',
                    //   style: GoogleFonts.castoro(
                    //     fontSize: 20,
                    //     shadows: [
                    //       const Shadow(
                    //           blurRadius: 10.0,
                    //           color: Colors.black,
                    //           offset: Offset(2, -2))
                    //     ],
                    //     foreground: Paint()
                    //       ..style = PaintingStyle.stroke
                    //       ..strokeWidth = 5
                    //       ..color = tc5,
                    //   ),
                    // ),
                    // Solid text as fill.
                    Text(
                      'Your Current Amount Rs. ${listamount.toStringAsFixed(2)}',
                      style: GoogleFonts.castoro(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: double.infinity,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const CreateList();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.mode_edit_outline_sharp),
                    color: Colors.black,
                    alignment: Alignment.topRight,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: widget.data['items'].length,
                    itemBuilder: (context, index) {
                      final listdata = widget.data['items'][index];

                      return Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(131, 193, 193, 1),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ]),
                        //     child: ListTile(
                        // title: Text(widget.items[index]['items']),
                        //
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.asset(listdata['pimage']),
                            title: Text(widget.data['items'][index]['pname']
                                .toString()),
                            subtitle:
                                Text('Rs.${listdata['pprice'].toString()}'),
                            trailing: Checkbox(
                              value: widget.data['items'][index]['ischecked'] ==
                                  true,
                              activeColor:
                                  const Color.fromRGBO(131, 193, 193, 1),
                              checkColor: const Color.fromARGB(255, 1, 1, 1),
                              tristate: true, // Fix typo here
                              onChanged: (newBool) {
                                setState(() {
                                  if (newBool == null || newBool) {
                                    widget.data['items'][index]['ischecked'] =
                                        newBool;
                                  }
                                  total = calculateTotal(widget.data['items']);
                                  remaining = listamount - total;
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.castoro(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Rs.${total}',
                            style: GoogleFonts.castoro(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            remaining >= 0 ? 'Remaining ' : "Exceeded",
                            style: GoogleFonts.castoro(
                              fontSize: 25,
                              color: remaining >= 0
                                  ? Colors.green[600]
                                  : Colors.red[600],
                            ),
                          ),
                          Text(
                            'Rs.${remaining}',
                            style: GoogleFonts.castoro(
                              fontSize: 25,
                              color: remaining >= 0
                                  ? Colors.green[600]
                                  : Colors.red[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            final nAmount = await openDialog();
                            setState(() {
                              listamount = double.parse(nAmount!);
                              remaining = listamount - total;
                            });
                          },
                          child: Text(
                            "Change Amount",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(tc3),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            saveCheckList();
                            AnimatedButton(
                              text: 'Success Dialog',
                              color: Colors.green,
                              pressEvent: () {
                                AwesomeDialog(
                                  context: context,
                                  animType: AnimType.leftSlide,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.success,
                                  showCloseIcon: true,
                                  title: 'Succes',
                                  desc:
                                      'Saved Successfully',
                                  btnOkOnPress: () {
                                    debugPrint('OnClcik');
                                  },
                                  btnOkIcon: Icons.check_circle,
                                  onDismissCallback: (type) {
                                    debugPrint(
                                        'Dialog Dissmiss from callback $type');
                                  },
                                ).show();
                              },
                            );
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(tc3),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> openDialog() {
    return showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Enter amount you have",
                style: TextStyle(color: tc1),
              ),
              content: TextField(
                keyboardType: TextInputType.number,
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(hintText: 'Enter Amount'),
                onSubmitted: (_) => submit(),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      submit();
                      setState(() {});
                    },
                    child: Text(
                      'Add Amount',
                      style: TextStyle(color: tc3),
                    ))
              ],
            ));
  }

  void submit() {
    Navigator.of(context).pop(controller.text);
  }

  double calculateTotal(List data) {
    double totalAmount = 0;
    for (var item in data) {
      if (item['ischecked'] == true) {
        totalAmount += item['pprice'];
      }
    }
    return totalAmount;
  }

  Future<void> saveCheckList() async {
    List<dynamic> filteredList = widget.data['items']
        .where((item) => item['ischecked'] == true)
        .toList();
    final data = {
      "ltitle": widget.data['lTitle'],
      "items": filteredList,
      "id": widget.data['id'],
      'total': total
    };

    await Api.saveCheckList(data);
  }
}
