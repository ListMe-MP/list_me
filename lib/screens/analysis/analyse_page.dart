import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/screens/analysis/chart.dart';

class Analyse extends StatefulWidget {
  const Analyse({Key? key}) : super(key: key);

  @override
  State<Analyse> createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Year'), // Modify the text for each tab
                Tab(text: 'Month'),
                Tab(text: 'Day'),
              ],
            ),
            title: const Text(
              "Analysis",
              style: TextStyle(color: tc1),
              textAlign: TextAlign.justify,
            ),
            backgroundColor: tc4,
            foregroundColor: tc1,
          ),
          body: TabBarView(
            children: [
              Tab(child: const Chart()), // Replace with actual content
              Tab(child: Text("Content for Month")),
              Tab(child: Text("Content for Day")),
            ],
          ),
        ),
      ),
    );
  }
}
