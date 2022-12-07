import 'package:flutter/material.dart';
import 'package:clubrecruitment/Practice.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: Stack(
          children:<Widget>[

            Container(
              padding:EdgeInsets.fromLTRB(10,60 ,80,50),
              margin:EdgeInsets.all(30.0),
              child: Text("Title:- \n\n\n\nAnswer:- ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,

              ),
            ),
            Container(
                child: IconButton(onPressed:null, icon:Icon(Icons.delete,color: Colors.black,size: 20.0,)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.amber,

                ),
                margin:EdgeInsets.fromLTRB(140, 160, 180, 100)

            ),
            Container(
              padding:EdgeInsets.fromLTRB(10,60 ,80,50),
              margin:EdgeInsets.fromLTRB(230, 30, 0, 0),
              child: Text("Title:- \n\n\n\nAnswer:- ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,


              ),
            ),
            Container(
              child: IconButton(onPressed:null, icon:Icon(Icons.delete,color: Colors.black,size: 20.0,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,

              ),
              margin:EdgeInsets.fromLTRB(340, 160, 0, 0),

            ),
            Container(
              padding:EdgeInsets.fromLTRB(10,60 ,80,50),
              margin:EdgeInsets.fromLTRB(230, 230, 0, 0),
              child: Text("Title:- \n\n\n\nAnswer:- ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,


              ),
            ),
            Container(
              child: IconButton(onPressed:null, icon:Icon(Icons.delete,color: Colors.black,size: 20.0,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,

              ),
              margin:EdgeInsets.fromLTRB(340, 360, 0, 0),

            ),
            Container(
              padding:EdgeInsets.fromLTRB(10,60 ,80,50),
              margin:EdgeInsets.fromLTRB(30, 230, 0, 0),
              child: Text("Title:- \n\n\n\nAnswer:- ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,


              ),
            ),
            Container(
              child: IconButton(onPressed:null, icon:Icon(Icons.delete,color: Colors.black,size: 20.0,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,

              ),
              margin:EdgeInsets.fromLTRB(140, 360, 0, 0),

            ),

          ],
        ),




        floatingActionButton: FloatingActionButton(onPressed:null,
          child:Text("+",style:TextStyle(fontSize: 25.0,color: Colors.black)),
          hoverColor: Colors.blueAccent,
          backgroundColor: Colors.amber,


        ),
      );

  }
}




