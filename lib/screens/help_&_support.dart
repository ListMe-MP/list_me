import 'package:flutter/material.dart';

import '../components/colors.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Help & Support",
            style: TextStyle(color: tc1),
            textAlign: TextAlign.justify,
          ),
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "List Me | Help Center",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "How can we help?",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
      
      
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
       
              //FAQ section
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {  },
                    child: Text("FAQ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),),
                  ),
                ),
                //child: Text("FAQ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            
      
              //questions
              FAQList(),
      
              //Categories 
               Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {  },
                    child: Text("Categories", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),),
                  ),
                ),

                SizedBox(height: 10,),
      
                //category list
                Categorybar(text: "Genaral"),
                Categorybar(text: "Create List"),
                Categorybar(text: "Check List"),
                Categorybar(text: "Analysis"),
            ],
          ),
        ),
      )
    );
  }
}

//creating the FAQ list
class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Prevents scrolling within the ListView
      children: [
        FAQItem(
          question: "How to create a new list?",
        ),
        FAQItem(
          question: "How to share a list?",
        ),
        FAQItem(
          question: "How to add items to a list?",
        ),
        FAQItem(
          question: "How to remove items from a list?",
        ),
        // Add more FAQItem widgets for other questions
      ],
    );
  }
}

//creating the circle icon for the list
class FAQItem extends StatelessWidget {
  final String question;

  FAQItem({
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.circle), 
      title: Text(
        question,
        style: TextStyle(fontSize: 18),
      ),
      onTap: () {
        
      },
    );
  }
}

//create a common bar for catedory list

class Categorybar extends StatefulWidget {
  final String text;
  const Categorybar({
    Key? key,
    required this.text,
  }) : super(key: key);


  @override
  State<Categorybar> createState() => _CategorybarState();
}

class _CategorybarState extends State<Categorybar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            
          ],
        ),
      ),
    );
  }
}