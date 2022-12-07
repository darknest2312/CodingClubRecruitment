import 'package:flutter/material.dart';
import 'package:clubrecruitment/Practice.dart';

class prac extends StatefulWidget {
  @override
  State<prac> createState() => _pracState();
}

class _pracState extends State<prac> {
  int myIndex=0;
  List<Widget> widgetlist= [
    prac(),
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
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            Container(
              padding:EdgeInsets.fromLTRB(0,30 ,120,0),
              margin:EdgeInsets.all(10.0),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Title:- \n\n\n  ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                    Text("Answer:- \n ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                    IconButton(onPressed: null, icon: Icon(Icons.delete,size:30,color:Colors.red))
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,
              ),
            ),
            Container(
              padding:EdgeInsets.fromLTRB(0,30 ,120,0),
              margin:EdgeInsets.all(10.0),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Title:- \n\n\n  ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                    Text("Answer:- \n ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                    IconButton(onPressed: null, icon: Icon(Icons.delete,size:30,color:Colors.red))
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,
              ),
            ),
            Container(
              padding:EdgeInsets.fromLTRB(0,30 ,120,0),
              margin:EdgeInsets.all(10.0),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Title:- \n\n\n  ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                    Text("Answer:- \n ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                    IconButton(onPressed: null, icon: Icon(Icons.delete,size:30,color:Colors.red))
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,
              ),
            ),
            Container(
              padding:EdgeInsets.fromLTRB(0,30 ,120,0),
              margin:EdgeInsets.all(10.0),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Title:- \n\n\n  ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                    Text("Answer:- \n ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                    IconButton(onPressed: null, icon: Icon(Icons.delete,size:30,color:Colors.red))
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,
              ),
            ),
            Container(
              padding:EdgeInsets.fromLTRB(0,30 ,120,0),
              margin:EdgeInsets.all(10.0),
              child:
                 SingleChildScrollView(
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          Text("Title:- \n\n\n  ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                        Text("Answer:- \n ",style:TextStyle(fontFamily:'ZenDots',fontSize:12,)),
                        IconButton(onPressed: null, icon: Icon(Icons.delete,size:30,color:Colors.red))
                        ],
                        ),
                        ),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.amber,
                        ),
                        )
                        ],
                        ),





        floatingActionButton: FloatingActionButton(onPressed:null,
          child:Text("+",style:TextStyle(fontSize: 25.0,color: Colors.black)),
          hoverColor: Colors.blueAccent,
          backgroundColor: Colors.blue,


        ),
      );

  }
}




