import 'package:flutter/material.dart';
import 'package:clubrecruitment/prac.dart';

class FlashCard extends StatelessWidget {
  String Title='';
  String Answer='';

  FlashCard({required this.Title,required this.Answer});

  @override
  Widget build(BuildContext context) {

    return  Card(
            color: Colors.amber,

            margin:EdgeInsets.all(10.0),
        child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text("Q:- ${Title} \n\n",style:TextStyle(fontFamily:'ZenDots',fontSize:15,)),

                 Text("A:- ${Answer}\n\n  ",style:TextStyle(fontFamily:'ZenDots',fontSize:15,)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: null, icon: Icon(Icons.delete,size:20,color:Colors.red))
                  ],
                )
        ],
        ),

        );


  }
}

