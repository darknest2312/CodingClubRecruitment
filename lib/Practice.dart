import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';






class Practice extends StatefulWidget {

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  var value1="Touch Arrow For Question";
  var value2="No Question on the Screen yet ";
  var randomindex;
  bool isBack=true;
  double angle =0;
  void _flip()
  {
    setState(() {
      angle=(angle+pi)%(2*pi);

    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(


          backgroundColor: Colors.white12,
          appBar: AppBar(
            title: Text("FlashCards", style: TextStyle(fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Oswald')),


            centerTitle: true,
            backgroundColor: Colors.purple[600],
          ),
          body:Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.purple, Colors.blueAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.4, 0.7],
                tileMode: TileMode.repeated,
              ),
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Carddata').snapshots(),
              builder: (context,AsyncSnapshot snapshot){
                if (!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return  Column(children: [
                   GestureDetector(
                     onTap: _flip,
                     child: TweenAnimationBuilder(tween: Tween<double>(begin: 0,end:angle),
                         duration: Duration(seconds:1),
                         builder: (BuildContext context,double val,__){
                       if(val>=pi/2){
                         isBack = false;
                       }
                       else
                         {
                           isBack=true;
                         }
                       return Container(
                         child: Transform(
                           alignment: Alignment.center,
                           transform: Matrix4.identity()
                             ..setEntry(3, 2, 0.001)
                             ..rotateY(val),
                           child: Container(
                               child: isBack
                                   ? Container(
                                   child: Center(
                                     child: Column(
                                       children: [

                                         Text("Question:- ${value1} \n\n\n\n", style: TextStyle(
                                             fontSize: 18, fontFamily: 'Oswald')),
                                         Text("Touch Card to see answer \n\n", style: TextStyle(
                                             fontSize: 14, fontFamily: 'Oswald',color:Colors.white))


                                       ],
                                     ),
                                   ),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15.0),
                                     color: Colors.red[600],


                                   ),
                                   padding: EdgeInsets.all(50.0),
                                   margin: EdgeInsets.all(30)


                               )
                                   : Transform(
                                     alignment:Alignment.center,
                                     transform: Matrix4.identity()
                                         ..rotateY(pi),
                                     child: Container(
                                     child: Center(
                                       child: Column(
                                         children: [

                                           Text("Answer:- ${value2} \n\n\n\n", style: TextStyle(
                                               fontSize: 18, fontFamily: 'Oswald')),
                                           Text("Touch Card to see question \n\n", style: TextStyle(
                                               fontSize: 14, fontFamily: 'Oswald',color:Colors.white))


                                         ],
                                       ),
                                     ),
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15.0),
                                       color: Colors.red[600],


                                     ),
                                     padding: EdgeInsets.all(50.0),
                                     margin: EdgeInsets.all(30)


                               ),
                                   )
                           ),
                         ),
                       );
                     }),
                   ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      IconButton(onPressed: (){
                        setState(() {
                          if (snapshot.data.docs.length==0){
                            showCupertinoDialog(context: context
                            , builder:(BuildContext context){
                             return CupertinoAlertDialog(
                                title:Text("No Cards Added Yet"),
                                content:Text("Please Add a Card"),
                                actions:<Widget>[
                                  TextButton(onPressed: () async {
                                    Navigator.pop(context);


                                  }, child: Text("OK"))
                                ]

                              );
                                });

                          }
                          randomindex=Random().nextInt(snapshot.data.docs.length);
                          value1=snapshot.data.docs[randomindex]['question'] ;
                          value2=snapshot.data.docs[randomindex]['answer'] ;
                        });

                      }, icon: Icon(Icons.navigate_next_rounded),iconSize: 50,color:Colors.white,),



                    ],
                  ),

                  Text("\n\n "),
                  ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Go Back To HomePage",style:TextStyle(fontFamily: 'Oswald'))),


                ]


                );

              },
            ),
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






