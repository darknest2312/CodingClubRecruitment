import 'package:flutter/material.dart';
import 'package:clubrecruitment/homepage.dart';
import 'package:clubrecruitment/prac.dart';



class Practice extends StatefulWidget {
  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  int myIndex=0;
  List<Widget> widgetlist= [
    HomePage(),
    Practice()

  ];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.deepPurple[600],
        appBar:AppBar(
          title: Text("FlashCards",style:TextStyle(fontSize: 25.0,fontWeight:FontWeight.bold,color:Colors.black,fontFamily:'ZenDots')),
          centerTitle:true,
          backgroundColor: Colors.deepOrange[300],
        ),
        body: Column(children: [
          Container(
            child:Center(
              child:Column(
                children: [

                  Text("Card #1\n\n\n\n\n\n ",style:TextStyle(fontSize: 12,fontFamily: 'ZenDots')),
                  Text("Title",style:TextStyle(fontSize: 30,fontFamily: 'ZenDots'))

                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.amber,



            ),
            padding:EdgeInsets.all(50.0),
            margin:EdgeInsets.fromLTRB(50, 130, 50,100)


            
                    
          ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: null, child: Text("Show Answer",style:TextStyle(fontFamily: 'ZenDots',color:Colors.black)),style:TextButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black

            )),

            IconButton(onPressed: null, icon:Icon(Icons.navigate_next,color: Colors.black,size:40.0))

        ],
        )
        ]






        ));




  }
}




