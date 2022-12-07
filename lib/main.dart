import 'package:flutter/material.dart';
import 'package:clubrecruitment/homepage.dart';
import 'package:clubrecruitment/Practice.dart';
import 'package:clubrecruitment/prac.dart';


void main() => runApp(MaterialApp(
  home:Home()

));

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex=0;
  List<Widget> widgetlist= [
    prac(),
    Practice(),


  ];
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex=index;
            });

          },
          currentIndex: myIndex,
          items: const [
       BottomNavigationBarItem(
           icon: Icon(Icons.credit_card_sharp),
         label:'Cards'

       ),
        BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
          label: 'Practice'
        ),
      ]),


      backgroundColor: Colors.deepPurple[600],
       // appBar:AppBar(
       //    title: Text("FlashCards",style:TextStyle(fontSize: 25.0,fontWeight:FontWeight.bold,color:Colors.black,fontFamily:'ZenDots')),
       //     centerTitle:true,
       //     backgroundColor: Colors.deepOrange[300],
       //     ),
      body:IndexedStack(
        children:widgetlist,
        index:myIndex,


      ),
    );

  }
}




