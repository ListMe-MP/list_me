import 'package:flutter/material.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/model/button_model.dart';
import 'package:provider/provider.dart';

import '../components/buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [tc4, tc3, tc2, tc1])
          ),


          child: Column(children: [
          
              // voice enable
              const Text("Voice enable"),
              // menu button
              const Text("Menu"),
              // title
              const Text("List Me"),
              // grid
              Expanded(child: Consumer<ButtonModel>(
                builder: (context, value, child) {
                    return GridView.builder(
                        itemCount: value.buttonTypes.length,
                        padding: EdgeInsets.all(36.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ButtonItemTile(
                            btnName: value.buttonTypes[index][0],
                            imgPath: value.buttonTypes[index][1],
                          );
                        });
                },
              )),
              // horizontal line
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Divider(
                    thickness: 1,
                    color: Color.fromRGBO(188, 253, 250, 1),
                ),
              ),
              // child: Color.fromRGBO(188, 253, 250, 1),
            
              // help button
              const Text("help"),
          ]),
              
        )
      ),
    );
  }
}
