import 'package:flutter/material.dart';
import 'package:clubrecruitment/homepage.dart';
import 'package:clubrecruitment/prac.dart';
import 'dart:math';
import 'package:clubrecruitment/main.dart';


class Practice extends StatefulWidget {
   var value1;
   var value2;

  Practice({ this.value1,  this.value2});

  @override
  State<Practice> createState() => _PracticeState(value1,value2);
}

class _PracticeState extends State<Practice> {
  var value1;
  var value2;


  _PracticeState(this.value1, this.value2);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(


          backgroundColor: Colors.deepPurple[600],
          appBar: AppBar(
            title: Text("FlashCards", style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'ZenDots')),


            centerTitle: true,
            backgroundColor: Colors.deepOrange[300],
          ),
          body: Column(children: [
            Container(
                child: Center(
                  child: Column(
                    children: [

                      Text("Question:- ${value1} ", style: TextStyle(
                          fontSize: 12, fontFamily: 'ZenDots')),


                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.amber,


                ),
                padding: EdgeInsets.all(50.0),
                margin: EdgeInsets.fromLTRB(50, 130, 50, 100)


            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){
                  openDialog();


                },
                    child: Text("Show Answer", style: TextStyle(
                        fontFamily: 'ZenDots', color: Colors.black)),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black

                    )),
                ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Go Back To HomePage",style:TextStyle(fontFamily: 'ZenDots'))),



              ],
            )
          ]


          )
      );


  }
  Future openDialog()=> showDialog(
      context: context,
      builder: (context)=>AlertDialog(
          title:Text('Answer'),
          content:
          Center(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text("The Answer is :- ${value2}\n"),




            ],
          ))

      ));
}






